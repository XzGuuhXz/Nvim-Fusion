return {
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      filetypes = {
        "css", "scss", "html", "javascript", "javascriptreact",
        "typescript", "typescriptreact", "vue", "svelte", "lua",
        "vim", "json", "yaml", "toml", "markdown",
      },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        mode = "background",
        AARRGGBB = true,
        virtualtext = "■",
      },
      buftypes = {},
    })
  end,
}
