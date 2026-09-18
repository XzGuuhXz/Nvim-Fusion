-- Optional providers are not requirements of this configuration.
vim.cmd("checkhealth lazy vim.treesitter")
local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
vim.fn.mkdir("test-results", "p")
vim.fn.writefile(lines, "test-results/health.txt")
local report = table.concat(lines, "\n")
assert(report:find("OK", 1, true), "Health check produced no successful checks")
assert(not report:find("ERROR", 1, true), "Health check errors: see test-results/health.txt")
