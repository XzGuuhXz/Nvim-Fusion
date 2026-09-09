-- NVIM FUSION // CONFIG TEST
-- Basic regression checks for the core configuration.
--
-- Run from the repository root:
--   nvim -u init.lua +"luafile tests/config_test.lua" +qa

local api = vim.api
local failures = {}

local function check(condition, message)
  if not condition then
    failures[#failures + 1] = message
  end
end

check(vim.fn.has("nvim-0.12") == 1, "Neovim 0.12+ is required")
check(vim.g.mapleader == " ", "mapleader must be Space")
check(vim.o.number == true, "line numbers must be enabled")
check(vim.o.relativenumber == false, "relative line numbers must be disabled")
check(vim.o.expandtab == true, "expandtab must be enabled")
check(vim.o.shiftwidth == 2, "shiftwidth must be 2")
check(vim.o.tabstop == 2, "tabstop must be 2")
check(vim.o.termguicolors == true, "termguicolors must be enabled")
check(vim.o.laststatus == 3, "laststatus must be 3")
check(vim.o.fillchars:find("eob:", 1, true) ~= nil, "fillchars must configure eob")
check(vim.g.colors_name == "nvim-fusion", "NVIM FUSION colorscheme must be active")

local function has_keymap(mode, lhs)
  for _, mapping in ipairs(api.nvim_get_keymap(mode)) do
    if mapping.lhs == lhs then
      return true
    end
  end
  return false
end

check(has_keymap("n", "<Space>w"), "<leader>w mapping is missing")
check(has_keymap("n", "<Space>e"), "<leader>e mapping is missing")
check(has_keymap("n", "gd"), "gd mapping is missing")
check(has_keymap("n", "<Space>rn"), "<leader>rn mapping is missing")

for _, server in ipairs({ "lua_ls", "pyright", "ts_ls", "jsonls", "html", "cssls", "clangd" }) do
  local ok = pcall(vim.lsp.config, server)
  check(ok, "LSP configuration is unavailable: " .. server)
end

if #failures > 0 then
  for _, failure in ipairs(failures) do
    vim.notify("FAIL: " .. failure, vim.log.levels.ERROR)
  end
  error("NVIM FUSION config test failed with " .. #failures .. " error(s)")
end

vim.notify("NVIM FUSION config test passed", vim.log.levels.INFO)
