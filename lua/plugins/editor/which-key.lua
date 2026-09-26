return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      icons = {
        breadcrumb = "󰅂",
        separator = "→",
        group = "󰉋",
      },
      win = {
        border = "rounded",
      },
      layout = {
        spacing = 3,
      },
    },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>f", group = "󰈞 Find" },
        { "<leader>l", group = "󰌘 LSP" },
        { "<leader>g", group = "󰊢 Git" },
        { "<leader>b", group = "󰈚 Buffer" },
        { "<leader>c", group = "󰌌 Code" },
      })
    end,
  },
}
