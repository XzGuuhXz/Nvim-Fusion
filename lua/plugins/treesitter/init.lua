return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    -- The command build path loads the plugin before executing TSUpdate.
    build = vim.fn.executable("tree-sitter") == 1 and ":TSUpdate" or false,
    config = function()
      local parsers = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "yaml",
        "bash",
        "markdown",
        "c",
        "cpp",
      }

      local function start(buf)
        if vim.api.nvim_buf_is_valid(buf) then
          local ok, language = pcall(vim.treesitter.language.get_lang, vim.bo[buf].filetype)

          if not ok or not language then
            return
          end

          -- Não gera erro se o parser ainda não estiver instalado.
          local loaded_ok, loaded = pcall(vim.treesitter.language.add, language)
          if not loaded_ok or not loaded then
            return
          end

          pcall(vim.treesitter.start, buf, language)
        end
      end

      local group = vim.api.nvim_create_augroup("NvimFusionTreesitter", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "*",
        callback = function(args) start(args.buf) end,
      })

      if vim.fn.executable("tree-sitter") == 1 then
        require("nvim-treesitter").install(parsers):await(function(err)
          if err then
            vim.notify("Nvim Fusion: parser install failed: " .. tostring(err), vim.log.levels.WARN)
            return
          end
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do start(buf) end
        end)
      else
        vim.notify(
          "Nvim Fusion: parsers do Tree-sitter não serão instalados automaticamente porque o CLI não está disponível.",
          vim.log.levels.WARN
        )
      end
    end,
  },
}
