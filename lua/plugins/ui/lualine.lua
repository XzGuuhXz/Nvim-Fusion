return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = {
          normal = {
            a = { fg = "#08050D", bg = "#C77DFF", gui = "bold" }, b = { fg = "#F5EFFF", bg = "#24133A" }, c = { fg = "#D8C8EA", bg = "#130B20" },
          },
          insert = {
            a = { fg = "#08050D", bg = "#F0ABFC", gui = "bold" }, b = { fg = "#F5EFFF", bg = "#24133A" }, c = { fg = "#D8C8EA", bg = "#130B20" },
          },
          visual = {
            a = { fg = "#08050D", bg = "#E879F9", gui = "bold" }, b = { fg = "#F5EFFF", bg = "#24133A" }, c = { fg = "#D8C8EA", bg = "#130B20" },
          },
          replace = {
            a = { fg = "#08050D", bg = "#FB7185", gui = "bold" }, b = { fg = "#F5EFFF", bg = "#29131E" }, c = { fg = "#D8C8EA", bg = "#130B20" },
          },
          command = {
            a = { fg = "#08050D", bg = "#A78BFA", gui = "bold" }, b = { fg = "#F5EFFF", bg = "#24133A" }, c = { fg = "#D8C8EA", bg = "#130B20" },
          },
          inactive = {
            a = { fg = "#8E7A9F", bg = "#0D0816" }, b = { fg = "#8E7A9F", bg = "#0D0816" }, c = { fg = "#5F4B70", bg = "#08050D" },
          },
        },
        component_separators = { left = "│", right = "│" }, section_separators = { left = "", right = "" }, globalstatus = true,
        disabled_filetypes = { statusline = { "alpha" } }, refresh = { statusline = 500 },
      },
      sections = {
        lualine_a = {{ "mode", padding = { left = 2, right = 2 }, fmt = function(str) local icons = { n = "󰋜", i = "󰏫", v = "󰈈", V = "󰈈", c = "󰘳", R = "󰑎", t = "󰆍" }; return (icons[vim.fn.mode()] or "󰋜") .. " " .. str:sub(1, 1) end }},
        lualine_b = {
          { "branch", icon = "󰊢", padding = { left = 2, right = 2 } },
          { "diff", padding = { left = 1, right = 1 }, symbols = { added = "󰐕 ", modified = "󰏬 ", removed = "󰍵 " } },
          { "diagnostics", padding = { left = 1, right = 1 }, sources = { "nvim_lsp" }, symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " }, update_in_insert = false },
        },
        lualine_c = {{ "filename", padding = { left = 2, right = 2 }, file_status = true, path = 1, symbols = { modified = " 󰏫 ", readonly = " 󰌾 ", unnamed = "󰡯 [Sem nome]" } }},
        lualine_x = {
          { function() return "󰥔 " .. os.date("%H:%M") end, padding = { left = 1, right = 1 } },
          { "encoding", padding = { left = 1, right = 1 } }, { "filetype", padding = { left = 1, right = 1 } },
        },
        lualine_y = {{ "progress", padding = { left = 2, right = 2 } }}, lualine_z = {{ "location", padding = { left = 2, right = 2 } }},
      },
      inactive_sections = { lualine_a = {}, lualine_b = {}, lualine_c = {{ "filename", padding = { left = 2, right = 2 } }}, lualine_x = {{ "location", padding = { left = 2, right = 2 } }}, lualine_y = {}, lualine_z = {} },
      extensions = { "nvim-tree" },
    },
  },
}
