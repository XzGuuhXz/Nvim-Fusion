-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Configure leaders before plugin specs are loaded.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load specs explicitly instead of relying on lazy.nvim's module importer.
-- This avoids "No specs found for module plugins" when the local runtimepath
-- or lazy.nvim cache is stale.
local specs = {
  require("plugins.completion.nvim-cmp"),
  require("plugins.core.autopairs"),
  require("plugins.core.lsp"),
  require("plugins.core.lspkind"),
  require("plugins.core.treesitter"),
  require("plugins.core.trouble"),
  require("plugins.editor.nvim-tree"),
  require("plugins.editor.telescope"),
  require("plugins.editor.which-key"),
  require("plugins.git.gitsigns"),
  require("plugins.ui.alpha"),
  require("plugins.ui.bufferline"),
  require("plugins.ui.colorizer"),
  require("plugins.ui.indent-blankline"),
  require("plugins.ui.lualine"),
  require("plugins.ui.tokyonight"),
}

require("lazy").setup(specs, {
  ui = {
    border = "rounded",
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤",
    },
  },
  install = {
    colorscheme = { "tokyonight" },
  },
  checker = {
    enabled = true,
  },
})
