-- Nvim Fusion
-- Ponto de entrada da configuração.
-- Requer Neovim >= 0.12.0

if vim.fn.has("nvim-0.12") ~= 1 then
  vim.api.nvim_err_writeln("Nvim Fusion requer Neovim >= 0.12.0")
  return
end

require("config")
