-- A single exit-code contract for local runs and CI, including startup errors.
local ok, err = xpcall(function()
  assert(vim.v.errmsg == "", vim.v.errmsg)
  local test = assert(vim.env.NVIM_FUSION_TEST, "Set NVIM_FUSION_TEST to a test file")
  dofile(vim.g.nvim_fusion_root .. "/" .. test)
  assert(vim.v.errmsg == "", vim.v.errmsg)
end, debug.traceback)
if not ok then
  io.stderr:write(tostring(err) .. "\n")
  vim.cmd("cquit 1")
else
  vim.cmd("qa!")
end
