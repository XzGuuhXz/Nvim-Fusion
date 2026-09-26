-- Open real files from temporary projects after scripts/bootstrap_lsp.lua.
local files = {
  { "lua_ls", "lua", "main.lua", "local answer = 42" },
  { "pyright", "python", "main.py", "answer = 42" },
  { "ts_ls", "typescript", "main.ts", "const answer: number = 42" },
  { "jsonls", "json", "main.json", '{"answer":42}' },
  { "html", "html", "index.html", "<main>hello</main>" },
  { "cssls", "css", "style.css", "body { color: red; }" },
  { "clangd", "c", "main.c", "int main(void) { return 0; }" },
}
local root = vim.fn.tempname()
vim.fn.mkdir(root, "p")
vim.fn.writefile({ '{"name":"nvim-fusion-test"}' }, root .. "/package.json")
vim.fn.writefile({ "{}" }, root .. "/tsconfig.json")
vim.fn.writefile({ "" }, root .. "/.git")

for _, item in ipairs(files) do
  local server, ft, name, content = unpack(item)
  local path = root .. "/" .. name
  vim.fn.writefile({ content }, path)
  vim.cmd.edit(vim.fn.fnameescape(path))
  assert(vim.bo.filetype == ft, "filetype mismatch: " .. name)
  local attached = vim.wait(30000, function()
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
      if client.name == server then return true end
    end
  end, 200)
  assert(attached, "client did not attach: " .. server .. " for " .. name)
  assert(vim.fn.maparg("gd", "n", false, true).buffer == 1, "LspAttach keymap missing: " .. name)
  vim.cmd.bdelete({ bang = true })
end
vim.fn.delete(root, "rf")
print("All seven LSP clients attached")
