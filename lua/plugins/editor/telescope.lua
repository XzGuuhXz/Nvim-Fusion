return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Telescope",
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

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "󰈞 Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "󰍉 Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "󰈚 List buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "󰋖 Help" })
  end,
}
