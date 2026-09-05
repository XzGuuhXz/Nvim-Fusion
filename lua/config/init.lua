if vim.fn.has("nvim-0.12") ~= 1 then
  vim.notify("Nvim-Fusion requires Neovim 0.12+.", vim.log.levels.ERROR)
  return
end

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
