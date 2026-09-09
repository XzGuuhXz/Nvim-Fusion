return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "jsonls",
        "html",
        "cssls",
        "clangd",
      },
      -- O Nvim Fusion controla explicitamente a ativação com vim.lsp.enable().
      automatic_enable = false,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },
}
