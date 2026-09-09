return {
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
}
