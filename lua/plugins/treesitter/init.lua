return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local parsers = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "yaml",
        "bash",
        "markdown",
        "c",
        "cpp",
      }

      require("nvim-treesitter").install(parsers)

      local group = vim.api.nvim_create_augroup("NvimFusionTreesitter", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = parsers,
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
