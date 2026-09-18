local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local output = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Falha ao instalar lazy.nvim:\n", "ErrorMsg" },
      { output, "WarningMsg" },
    }, true, {})
    return
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  performance = { rtp = { paths = { vim.g.nvim_fusion_root } } },
  lockfile = vim.g.nvim_fusion_root .. "/lazy-lock.json",
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
    colorscheme = { "nvim-fusion" },
  },
  checker = { enabled = true },
})
