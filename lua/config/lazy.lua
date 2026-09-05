-- Bootstrap lazy.nvim deterministically.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local lazy_commit = "85c7ff3711b730b4030d03144f6db6375044ae82"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", lazyrepo, lazypath })
  if vim.v.shell_error == 0 then
    vim.fn.system({ "git", "-C", lazypath, "checkout", "--detach", lazy_commit })
  end
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to install lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Load specs explicitly so the configuration is deterministic and easy to audit.
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
