-- Nvim Fusion
-- Ponto de entrada da configuração.
-- Requer Neovim >= 0.12.0

if vim.fn.has("nvim-0.12") ~= 1 then
  vim.api.nvim_err_writeln("Nvim Fusion requer Neovim >= 0.12.0")
  return
end

-- Resolve modules and colors when launched with -u from any checkout.
local root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
vim.opt.runtimepath:prepend(root)
vim.g.nvim_fusion_root = root
require("config")
