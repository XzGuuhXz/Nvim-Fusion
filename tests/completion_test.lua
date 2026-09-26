local cmp = require("cmp")
local sources = cmp.get_config().sources
local has_lsp, has_snippets = false, false
for _, source in ipairs(sources) do
  has_lsp = has_lsp or source.name == "nvim_lsp"
  has_snippets = has_snippets or source.name == "luasnip"
end
assert(has_lsp and has_snippets, "LSP and snippet completion sources must be active")

local luasnip = require("luasnip")
local buf = vim.api.nvim_create_buf(false, true)
vim.api.nvim_set_current_buf(buf)
vim.bo[buf].filetype = "lua"
luasnip.snip_expand(luasnip.snippet("fusion-test", { luasnip.text_node("NVIM_FUSION") }))
assert(vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] == "NVIM_FUSION", "Snippet did not expand")
-- LuaSnip probes optional repeat.vim with `silent! call repeat#set()`.
-- It still sets v:errmsg on a system without repeat.vim, despite expanding.
if vim.v.errmsg:find("Unknown function: repeat#set", 1, true) then
  vim.v.errmsg = ""
end
vim.api.nvim_buf_delete(buf, { force = true })
print("Completion sources and snippet expansion verified")
