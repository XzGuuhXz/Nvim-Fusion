return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-h>"] = "which_key",
            },
          },
        },
      })

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })

      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git files" })

      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, { desc = "Search word" })

      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

      vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    end,
  },
}
