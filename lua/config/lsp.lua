local M = {}

function M.on_attach(_, bufnr)
  local opts = { buffer = bufnr, silent = true }

  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
  end

  map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "K", vim.lsp.buf.hover, "Hover documentation")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature help")
  map("n", "gr", vim.lsp.buf.references, "Go to references")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions")
  map("n", "<leader>lf", function()
    vim.lsp.buf.format({ async = true })
  end, "Format code")
  map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
  map("n", "<leader>d", vim.diagnostic.open_float, "Show diagnostic")
end

return M
