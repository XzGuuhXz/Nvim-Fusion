return {
  {
    "nvim-fusion-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nvim-fusion")
    end,
  },
}
