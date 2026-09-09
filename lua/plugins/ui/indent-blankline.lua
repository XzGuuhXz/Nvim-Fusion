return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = { "help", "dashboard", "lazy", "mason", "notify", "toggleterm", "NvimTree" },
      },
    },
  },
}
