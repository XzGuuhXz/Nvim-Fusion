return {
  {
    "mason-org/mason.nvim",
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
      ensure_installed = require("config.servers"),
      -- O Nvim Fusion controla explicitamente a ativação com vim.lsp.enable().
      automatic_enable = false,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      -- Mason may classify the initial -u init.lua phase as headless before
      -- the TUI attaches. The pinned mason-lspconfig skips ensure_installed
      -- in that case, so check missing packages once an actual UI attaches.
      vim.api.nvim_create_autocmd("UIEnter", {
        once = true,
        callback = function()
          local registry = require("mason-registry")
          registry.refresh(vim.schedule_wrap(function(ok)
            if not ok then
              vim.notify("Nvim Fusion: falha ao atualizar o registro Mason", vim.log.levels.WARN)
              return
            end
            local mappings = require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package
            for _, server in ipairs(require("config.servers")) do
              local name = mappings[server]
              if name and registry.has_package(name) then
                local pkg = registry.get_package(name)
                if not pkg:is_installed() and not pkg:is_installing() then pkg:install() end
              end
            end
          end))
        end,
      })
      -- Servers are enabled before the download completes. Retry buffers
      -- opened during a fresh installation as each package becomes ready.
      require("mason-registry"):on("package:install:success", vim.schedule_wrap(function()
        vim.lsp.enable(require("config.servers"))
      end))
    end,
  },
}
