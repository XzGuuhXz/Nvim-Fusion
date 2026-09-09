return {
  -- Lualine
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

  -- Tema TokyoNight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      light_style = "day",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help", "vista_kind", "terminal", "packer" },
      day_brightness = 0.3,
      hide_inactive_statusline = false,
      dim_inactive = false,
      lualine_bold = false,
      on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
      end,
      on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = colors.orange }
        highlights.CursorLineNr = { fg = colors.yellow, bold = true }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- NvimTree como único explorador de arquivos
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "󰉖 Toggle file explorer" },
      { "<leader>o", "<cmd>NvimTreeFocus<cr>", desc = "󰋖 Focus file explorer" },
      { "<leader>fe", "<cmd>NvimTreeFindFile<cr>", desc = "󰈞 Find file in explorer" },
    },
    opts = {
      view = {
        width = 35,
        signcolumn = "yes",
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "name",
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "󰈚",
            symlink = "󰌷",
            folder = {
              arrow_closed = "󰅂",
              arrow_open = "󰅀",
              default = "󰉋",
              open = "󰝰",
              empty = "󰉖",
              empty_open = "󰷏",
              symlink = "󰉒",
              symlink_open = "󰷑",
            },
            git = {
              unstaged = "󰄱",
              staged = "󰱒",
              unmerged = "󰘬",
              renamed = "󰁕",
              untracked = "󰻭",
              deleted = "󰍵",
              ignored = "󰋙",
            },
          },
        },
      },
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        themable = true,
        numbers = "ordinal",
        indicator = { icon = "▎", style = "icon" },
        buffer_close_icon = "󰅖",
        modified_icon = "󰏫",
        close_icon = "󰅙",
        left_trunc_marker = "󰅍",
        right_trunc_marker = "󰅌",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        offsets = {
          {
            filetype = "NvimTree",
            text = "󰉖 File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
    keys = {
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "󰒺 Next buffer" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "󰒻 Previous buffer" },
      { "<leader>x", "<cmd>bdelete<cr>", desc = "󰅙 Close buffer" },
    },
  },

  -- Indentação visual
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = { "help", "dashboard", "lazy", "mason", "notify", "toggleterm", "NvimTree" },
      },
    },
  },

  -- Color Highlight
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        mode = "background",
        AARRGGBB = true,
        virtualtext = "■",
      },
      buftypes = {},
    },
  },

  -- Which-key: única configuração, usando API atual
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      icons = {
        breadcrumb = "󰅂",
        separator = "󰘔",
        group = "󰉋",
      },
      win = {
        border = "rounded",
      },
      layout = {
        spacing = 3,
      },
    },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>f", group = "󰈞 Find" },
        { "<leader>l", group = "󰌘 LSP" },
        { "<leader>g", group = "󰊢 Git" },
        { "<leader>w", group = "󰖲 Window" },
        { "<leader>b", group = "󰈚 Buffer" },
        { "<leader>d", group = "󰃤 Diagnostics" },
        { "<leader>c", group = "󰌌 Code" },
        { "<leader>pf", desc = "Find files" },
        { "<leader>ps", desc = "Search text" },
        { "<leader>pb", desc = "Buffers" },
        { "<leader>ff", desc = "Find files" },
        { "<leader>fg", desc = "Live grep" },
        { "<leader>fb", desc = "List buffers" },
        { "<leader>fe", desc = "Find file in explorer" },
        { "<leader>lf", desc = "Format code" },
        { "<leader>ls", desc = "Signature help" },
        { "<leader>rn", desc = "Rename symbol" },
        { "<leader>ca", desc = "Code actions" },
      })
    end,
  },

  -- Dashboard
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }
      dashboard.section.buttons.val = {
        dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "󰉖  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "󰄉  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "󰊢  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "󰒓  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
        dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
      }
      alpha.setup(dashboard.opts)
    end,
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      icons = {
        error = "󰅚",
        warning = "󰀪",
        hint = "󰌶",
        information = "󰋽",
        other = "󰠱",
      },
    },
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "󰒡 Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "󰒡 Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "󰘦 Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "󰌘 LSP" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "󰂖 Location List" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "󰂖 Quickfix List" },
    },
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = { follow_files = true },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, "󰊢 Next Git hunk")
        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, "󰊢 Previous Git hunk")
        map("n", "<leader>hs", gs.stage_hunk, "󰐕 Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "󰦒 Reset hunk")
        map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "󰐕 Stage hunk")
        map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "󰦒 Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer, "󰐕 Stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "󰦒 Undo stage hunk")
        map("n", "<leader>hR", gs.reset_buffer, "󰦒 Reset buffer")
        map("n", "<leader>hp", gs.preview_hunk, "󰋖 Preview hunk")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "󰊢 Blame line")
        map("n", "<leader>tb", gs.toggle_current_line_blame, "󰊢 Toggle line blame")
        map("n", "<leader>hd", gs.diffthis, "󰦒 Diff this")
        map("n", "<leader>hD", function() gs.diffthis("~") end, "󰦒 Diff this ~")
        map("n", "<leader>td", gs.toggle_deleted, "󰍵 Toggle deleted")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "󰊢 Select hunk")
      end,
    },
  },
}
