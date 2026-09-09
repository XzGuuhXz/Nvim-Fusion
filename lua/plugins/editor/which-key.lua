return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      icons = {
        breadcrumb = "󰅂",
        separator = "󰘔",
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
        { "<leader>pf", desc = "Find files" },
        { "<leader>ps", desc = "Search text" },
        { "<leader>pb", desc = "Buffers" },
        { "<leader>ff", desc = "Find files" },
        { "<leader>fg", desc = "Live grep" },
        { "<leader>fb", desc = "List buffers" },
        { "<leader>fe", desc = "Find file in explorer" },
        { "<leader>lf", desc = "Format code" },
        { "<leader>ls", desc = "Signature help" },
        { "<leader>rn", desc = "Rename symbol" },
        { "<leader>ca", desc = "Code actions" },
        { "<leader>d", desc = "Show diagnostics" },
        { "<leader>w", desc = "Save file" },
      })
    end,
  },
}
