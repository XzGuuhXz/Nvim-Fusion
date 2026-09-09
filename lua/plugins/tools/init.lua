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
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git files" })
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, { desc = "Search word" })
      vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Buffers" })
    end,
  },

  -- Treesitter atual: requer Neovim >= 0.12 e usa a API nativa de parser/highlight
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local parsers = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "yaml",
        "bash",
        "markdown",
        "c",
        "cpp",
      }

      require("nvim-treesitter").install(parsers)

      local group = vim.api.nvim_create_augroup("NvimFusionTreesitter", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = parsers,
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
