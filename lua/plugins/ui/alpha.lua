return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local config_path = vim.fn.stdpath("config")
    local init_path = vim.fs.joinpath(config_path, "init.lua")

    dashboard.section.header.val = {
      "",
      "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "",
      "   ███████╗██╗   ██║███████╗██╗ ██████╗ ███╗   ██╗ ",
      "   ██╔════╝██║   ██║██╔════╝██║██╔═══██╗████╗  ██║ ",
      "   █████╗  ██║   ██║███████╗██║██║   ██║██╔██╗ ██║ ",
      "   ██╔══╝  ██║   ██║╚════██║██║██║   ██║██║╚██╗██║ ",
      "   ██║     ╚██████╔╝███████║██║╚██████╔╝██║ ╚████║ ",
      "   ╚═╝      ╚═════╝ ╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ",
      "",
      "       🚀 Versão 2.0 - Modular & Moderno 🚀 ",
      "",
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "󰉖  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "󰄉  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "󰊢  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "󰒓  Configuration", ":e " .. vim.fn.fnameescape(init_path) .. " <CR>"),
      dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
    }

    local config = {
      layout = {
        { type = "padding", val = 1 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      },
      opts = {
        margin = 5,
        setup = function()
          vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            desc = "disable tabline and statusline for alpha",
            callback = function()
              vim.opt.showtabline = 0
              vim.opt.laststatus = 0
            end,
          })
          vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            desc = "enable tabline and statusline after alpha",
            callback = function()
              vim.opt.showtabline = 2
              vim.opt.laststatus = 3
            end,
          })
        end,
      },
    }

    alpha.setup(config)
  end,
}
