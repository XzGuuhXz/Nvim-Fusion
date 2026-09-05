return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "󰈞 Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "󰍉 Live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "󰈚 List buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "󰋖 Help" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = " 󰍉 ",
        selection_caret = " 󰅂 ",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_ignore_patterns = {
          "%.git/",
          "node_modules/",
        },
      },
    })
  end,
}
