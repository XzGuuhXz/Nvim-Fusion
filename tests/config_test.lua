-- NVIM FUSION // CONFIG TEST
-- Basic regression checks for the core configuration.
--
-- Run from the repository root:
--   nvim -u init.lua +"luafile tests/config_test.lua" +qa

local api = vim.api
local failures = {}
local servers = require("config.servers")

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

local function has_keymap(lhs, buffer)
  local mapping = vim.fn.maparg(lhs, "n", false, true)
  return not vim.tbl_isempty(mapping) and (not buffer or mapping.buffer == 1)
end

check(has_keymap("<leader>w"), "<leader>w mapping is missing")
check(has_keymap("<leader>e"), "<leader>e mapping is missing")
local buf = api.nvim_create_buf(false, true)
api.nvim_buf_call(buf, function()
  vim.api.nvim_exec_autocmds("LspAttach", { buffer = buf, data = { client_id = 0 } })
  check(has_keymap("gd", true), "buffer-local gd mapping is missing")
  check(has_keymap("<leader>rn", true), "buffer-local rename mapping is missing")
end)
api.nvim_buf_delete(buf, { force = true })

check(vim.deep_equal(servers, { "lua_ls", "pyright", "ts_ls", "jsonls", "html", "cssls", "clangd" }), "server list changed")
local ts = vim.lsp.config.ts_ls
check(type(ts) == "table" and type(ts.on_attach) == "function", "upstream TypeScript callback was replaced")

for _, server in ipairs(servers) do
  check(type(vim.lsp.config[server]) == "table", "LSP configuration is unavailable: " .. server)
  check(vim.lsp.is_enabled(server), "LSP is not enabled: " .. server)
end

if #failures > 0 then
  for _, failure in ipairs(failures) do
    vim.notify("FAIL: " .. failure, vim.log.levels.ERROR)
  end
  error("NVIM FUSION config test failed with " .. #failures .. " error(s)")
end

vim.notify("NVIM FUSION config test passed", vim.log.levels.INFO)
