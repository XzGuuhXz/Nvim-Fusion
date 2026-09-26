"""Run the first-install test with a real PTY and basic xterm replies."""

import os
import pty
import fcntl
import re
import select
import struct
import subprocess
import sys
import termios
import time
from pathlib import Path


root = Path(__file__).resolve().parent.parent
output = root / "test-results" / "interactive.log"
output.parent.mkdir(parents=True, exist_ok=True)
master, slave = pty.openpty()
fcntl.ioctl(slave, termios.TIOCSWINSZ, struct.pack("HHHH", 30, 120, 0, 0))
command = [
    os.environ.get("NVIM_BIN", "nvim"),
    "-u", "init.lua",
    "+autocmd VimEnter * ++once luafile tests/run.lua",
]
process = subprocess.Popen(command, cwd=root, stdin=slave, stdout=slave, stderr=slave)
os.close(slave)
record = bytearray()
window = b""
deadline = time.monotonic() + 420
log = output.open("wb")

try:
    while process.poll() is None and time.monotonic() < deadline:
        readable, _, _ = select.select([master], [], [], 0.5)
        if not readable:
            continue
        try:
            data = os.read(master, 65536)
        except OSError:
            break
        if not data:
            break
        record.extend(data)
        log.write(data)
        log.flush()
        window = (window + data)[-1024:]
        if b"\x1b[c" in window or b"\x1b[0c" in window:
            os.write(master, b"\x1b[?1;2c")  # xterm primary device attributes
            window = b""
        if b"\x1b[6n" in window:
            os.write(master, b"\x1b[1;1R")
            window = b""
        if b"Press ENTER or type command to continue" in window:
            os.write(master, b"\r")
            window = b""
    if process.poll() is None:
        process.terminate()
        try:
            process.wait(timeout=5)
        except subprocess.TimeoutExpired:
            process.kill()
            process.wait()
    result = process.returncode
finally:
    log.close()
    os.close(master)

if time.monotonic() >= deadline:
    print("Interactive first-install test timed out (420s)", file=sys.stderr)
    sys.exit(124)
if result:
    stripped = re.sub(rb"\x1b\[[0-?]*[ -/]*[@-~]", b"", record)
    print(stripped[-2000:].decode(errors="replace"), file=sys.stderr)
    sys.exit(result)
print("Interactive first-install test passed")
