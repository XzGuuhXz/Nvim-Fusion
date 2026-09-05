return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    preset = "modern",
    delay = 200,
    expand = 1,
    notify = true,
    icons = {
      breadcrumb = "󰅂",
      separator = "󰘔",
      group = "󰉋",
      mappings = true,
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>t", group = "Terminal" },
      { "<leader>w", group = "Window" },
      { "<leader>b", group = "Buffer" },
      { "<leader>d", group = "Debug" },
      { "<leader>s", group = "Session" },
      { "<leader>n", group = "NvimTree" },
    })
  end,
}
