return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local colors = {
      bg = "#1a1b26",
      fg = "#c0caf5",
      yellow = "#e0af68",
      cyan = "#7dcfff",
      green = "#9ece6a",
      orange = "#ff9e64",
      violet = "#a9a1e1",
      blue = "#7aa2f7",
      red = "#f7768e",
    }

    local mode_icons = {
      n = "󰋜", i = "󰏫", v = "󰈈", V = "󰈈", c = "󰘳", no = "󰋜",
      s = "󰒅", S = "󰒅", ic = "󰏫", R = "󰑎", Rv = "󰑎", cv = "󰘳",
      ce = "󰘳", r = "󰌍", rm = "󰌍", ["r?"] = "󰌍", ["!"] = "󰞷", t = "󰆍",
    }

    local mode_colors = {
      n = colors.blue,
      i = colors.green,
      v = colors.violet,
      V = colors.violet,
      c = colors.orange,
      R = colors.red,
      t = colors.cyan,
    }

    return {
      options = {
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = " 󰊠", right = "" },
        globalstatus = true,
        refresh = { statusline = 1000 },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              local icon = mode_icons[vim.fn.mode()] or "󰋜"
              return " " .. icon .. " " .. str:sub(1, 1) .. " "
            end,
            color = function()
              return { bg = mode_colors[vim.fn.mode()] or colors.blue, fg = colors.bg, gui = "bold" }
            end,
          },
        },
        lualine_b = {
          { "branch", icon = "󰊢", color = { fg = colors.violet, gui = "bold" } },
          {
            "diff",
            symbols = { added = " 󰐕 ", modified = " 󰏬 ", removed = " 󰍵 " },
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.orange },
              removed = { fg = colors.red },
            },
          },
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = " 󰅚 ", warn = " 󰀪 ", info = " 󰋽 ", hint = " 󰌶 " },
            diagnostics_color = {
              error = { fg = colors.red },
              warn = { fg = colors.yellow },
              info = { fg = colors.cyan },
              hint = { fg = colors.blue },
            },
            update_in_insert = false,
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 1,
            symbols = { modified = " 󰏫 ", readonly = " 󰌾 ", unnamed = "󰡯 [Sem nome]" },
          },
        },
        lualine_x = {
          { "encoding", fmt = function(enc) return "󰉿 " .. enc:upper() end, color = { fg = colors.green, gui = "bold" } },
          { "fileformat", symbols = { unix = "󰌽", dos = "󰍲", mac = "󰀵" } },
          { "filetype", icon_only = false, icon = { align = "left" }, fmt = function(str) return " " .. str .. " " end },
        },
        lualine_y = { { "progress", icon = " 󰉿 ", color = { fg = colors.fg, gui = "bold" } } },
        lualine_z = { { "location", icon = "󰍉", color = { fg = colors.bg, bg = colors.blue, gui = "bold" } } },
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
    }
  end,
}
