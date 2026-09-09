return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = "󰊠", right = "" },
        globalstatus = true,
        refresh = { statusline = 1000 },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              local icons = {
                n = "󰋜", i = "󰏫", v = "󰈈", V = "󰈈", c = "󰘳",
                R = "󰑎", t = "󰆍",
              }
              return " " .. (icons[vim.fn.mode()] or "󰋜") .. " " .. str:sub(1, 1) .. " "
            end,
          },
        },
        lualine_b = {
          { "branch", icon = "󰊢" },
          { "diff", symbols = { added = "󰐕 ", modified = "󰏬 ", removed = "󰍵 " } },
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " },
            update_in_insert = false,
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 1,
            symbols = {
              modified = " 󰏫 ",
              readonly = " 󰌾 ",
              unnamed = "󰡯 [Sem nome]",
            },
          },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "nvim-tree" },
    },
  },
}
