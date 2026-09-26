local api = vim.api
local parsers = { "bash", "javascript", "tsx", "vimdoc", "lua" }
require("nvim-treesitter").install(parsers):wait(120000)
for _, ft in ipairs({ "sh", "javascriptreact", "typescriptreact", "help", "lua" }) do
  local buf = api.nvim_create_buf(false, true)
  api.nvim_set_current_buf(buf)
  vim.bo[buf].filetype = ft
  assert(vim.treesitter.highlighter.active[buf], "Treesitter inactive for " .. ft)
  api.nvim_buf_delete(buf, { force = true })
end
-- Missing parsers must not throw or attempt to start a highlighter.
local buf = api.nvim_create_buf(false, true)
api.nvim_set_current_buf(buf)
vim.bo[buf].filetype = "fusion_missing_parser"
assert(not vim.treesitter.highlighter.active[buf])
api.nvim_buf_delete(buf, { force = true })

assert(vim.fn.exists(":NvimTreeOpen") == 2, "Lazy command trigger missing")
local mapping = vim.fn.maparg("<leader>pv", "n", false, true)
assert(mapping.rhs == "<cmd>NvimTreeOpen<cr>", "Explorer mapping is broken")
vim.cmd.NvimTreeOpen()
assert(require("nvim-tree.api").tree.is_visible(), "Explorer did not open")
vim.cmd.NvimTreeClose()
-- nvim-tree's silent! cleanup of the legacy FileExplorer autocmd group
-- still sets v:errmsg on Neovim 0.12; it is harmless when netrw is disabled.
if vim.v.errmsg:find("E216: No such group or event: FileExplorer", 1, true) then
  vim.v.errmsg = ""
end

-- Exercise the registered expression maps in two real diff windows.
local spec = require("plugins.git.gitsigns")[1]
require("gitsigns")
vim.cmd.enew()
local left = api.nvim_get_current_buf()
api.nvim_buf_set_lines(left, 0, -1, false, { "same", "old", "same", "old", "same" })
vim.cmd.vnew()
local right = api.nvim_get_current_buf()
api.nvim_buf_set_lines(right, 0, -1, false, { "same", "new", "same", "new", "same" })
vim.cmd.diffthis()
vim.cmd.wincmd("p")
vim.cmd.diffthis()
vim.opt.diffopt:append("context:0")
vim.cmd.diffupdate()
spec.opts.on_attach(left)
for _, key in ipairs({ "]c", "[c" }) do
  local map = vim.fn.maparg(key, "n", false, true)
  assert(map.expr == 1 and map.callback() == key, "Native diff fallback missing: " .. key)
end
api.nvim_win_set_cursor(0, { 1, 0 })
api.nvim_feedkeys("]c", "xt", false)
assert(api.nvim_win_get_cursor(0)[1] == 2, "Next diff navigation failed")
api.nvim_win_set_cursor(0, { 5, 0 })
api.nvim_feedkeys("[c", "xt", false)
assert(api.nvim_win_get_cursor(0)[1] == 4, "Previous diff navigation failed")
vim.cmd("diffoff!")
print("Audit regression tests passed")
