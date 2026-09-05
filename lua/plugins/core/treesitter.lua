return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "neovim-treesitter/treesitter-parser-registry",
  },
  config = function()
    local treesitter = require("nvim-treesitter")
    local profiles = {
      core = {
        "bash", "c", "cpp", "css", "html", "javascript", "json",
        "lua", "markdown", "markdown_inline", "python", "query",
        "rust", "typescript", "vim", "vimdoc", "yaml",
      },
      full = {
        "bash", "c", "cpp", "css", "go", "html", "java", "javascript",
        "json", "lua", "markdown", "markdown_inline", "python", "query",
        "rust", "typescript", "vim", "vimdoc", "yaml",
      },
    }
    local profile = vim.g.nvim_fusion_treesitter_profile or "core"
    local languages = profiles[profile] or profiles.core

    treesitter.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })
    treesitter.install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        local ok, lang = pcall(vim.treesitter.language.get_lang, vim.bo.filetype)
        if not ok or not lang then
          return
        end

        local installed = treesitter.get_installed()
        if not vim.tbl_contains(installed, lang) then
          return
        end

        pcall(vim.treesitter.start)
        if vim.treesitter.query.get(lang, "indents") then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
        if vim.treesitter.query.get(lang, "folds") then
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo.foldmethod = "expr"
        end
      end,
    })

    vim.opt.foldenable = false
    vim.filetype.add({
      extension = { conf = "conf", env = "dotenv" },
      filename = {
        [".env"] = "dotenv",
        ["tsconfig.json"] = "jsonc",
      },
      pattern = { ["%.env%.[%w_.-]+"] = "dotenv" },
    })
  end,
}
