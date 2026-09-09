return {
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
}
