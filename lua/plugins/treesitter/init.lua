return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = function()
      -- O CLI é necessário para compilar/atualizar parsers.
      -- Se estiver ausente, não transforme a atualização do plugin em erro fatal.
      if vim.fn.executable("tree-sitter") == 1 then
        vim.cmd("TSUpdate")
      else
        vim.notify(
          "Nvim Fusion: tree-sitter CLI não encontrado. Instale tree-sitter-cli para atualizar os parsers.",
          vim.log.levels.WARN
        )
      end
    end,
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

      if vim.fn.executable("tree-sitter") == 1 then
        require("nvim-treesitter").install(parsers)
      else
        vim.notify(
          "Nvim Fusion: parsers do Tree-sitter não serão instalados automaticamente porque o CLI não está disponível.",
          vim.log.levels.WARN
        )
      end

      local group = vim.api.nvim_create_augroup("NvimFusionTreesitter", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = parsers,
        callback = function(args)
          local ok, language = pcall(vim.treesitter.language.get_lang, vim.bo[args.buf].filetype)

          if not ok or not language then
            return
          end

          -- Não gera erro se o parser ainda não estiver instalado.
          if not pcall(vim.treesitter.language.add, language) then
            return
          end

          pcall(vim.treesitter.start, args.buf, language)
        end,
      })
    end,
  },
}
