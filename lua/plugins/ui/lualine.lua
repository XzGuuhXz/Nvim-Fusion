return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight",
        component_separators = "",
        section_separators = "",
        globalstatus = true,
        refresh = { statusline = 1000 },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            padding = { left = 2, right = 2 },
            fmt = function(str)
              local icons = {
                n = "󰋜", i = "󰏫", v = "󰈈", V = "󰈈", c = "󰘳",
                R = "󰑎", t = "󰆍",
              }
              return (icons[vim.fn.mode()] or "󰋜") .. " " .. str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          { "branch", icon = "󰊢", padding = { left = 2, right = 2 } },
          {
            "diff",
            padding = { left = 2, right = 2 },
            symbols = { added = "󰐕 ", modified = "󰏬 ", removed = "󰍵 " },
          },
          {
            "diagnostics",
            padding = { left = 2, right = 2 },
            sources = { "nvim_lsp" },
            symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " },
            update_in_insert = false,
          },
        },
        lualine_c = {
          {
            "filename",
            padding = { left = 2, right = 2 },
            file_status = true,
            path = 1,
            symbols = {
              modified = " 󰏫 ",
              readonly = " 󰌾 ",
              unnamed = "󰡯 [Sem nome]",
            },
          },
        },
        lualine_x = {
          { "encoding", padding = { left = 1, right = 1 } },
          { "fileformat", padding = { left = 1, right = 1 } },
          { "filetype", padding = { left = 1, right = 1 } },
        },
        lualine_y = {
          { "progress", padding = { left = 2, right = 2 } },
        },
        lualine_z = {
          { "location", padding = { left = 2, right = 2 } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", padding = { left = 2, right = 2 } } },
        lualine_x = { { "location", padding = { left = 2, right = 2 } } },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "nvim-tree" },
    },
  },
}
