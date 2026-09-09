return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lsp = require("config.lsp")

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = lsp.on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = {
              globals = { "vim" },
              disable = { "missing-fields" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
            format = { enable = true },
          },
        },
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach = lsp.on_attach,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
            },
          },
        },
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        on_attach = lsp.on_attach,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      for _, server in ipairs({ "jsonls", "html", "cssls" }) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          on_attach = lsp.on_attach,
        })
      end

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = lsp.on_attach,
        cmd = { "clangd", "--background-index", "--clang-tidy" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        single_file_support = true,
      })

      vim.lsp.enable({
        "lua_ls",
        "pyright",
        "ts_ls",
        "jsonls",
        "html",
        "cssls",
        "clangd",
      })
    end,
  },
}
