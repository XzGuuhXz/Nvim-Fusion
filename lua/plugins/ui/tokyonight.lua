return {
  {
    dir = vim.fn.stdpath("config") .. "/lua/colors",
    name = "nvim-fusion-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nvim-fusion")
    end,
  },
}
