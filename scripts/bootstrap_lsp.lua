-- Explicit headless bootstrap. mason-lspconfig's ensure_installed skips headless.
-- Run after `:Lazy! restore`, with NVIM_FUSION_TEST=scripts/bootstrap_lsp.lua.
local registry = require("mason-registry")
local refreshed, refresh_error = registry.refresh()
assert(refreshed, "Mason registry refresh failed: " .. tostring(refresh_error))
local mappings = require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package

local pending = 0
local errors = {}
for _, server in ipairs(require("config.servers")) do
  local name = assert(mappings[server], "No Mason package for " .. server)
  local package = registry.get_package(name)
  if not package:is_installed() then
    pending = pending + 1
    package:install({}, function(success, err)
      if not success then
        errors[#errors + 1] = server .. ": " .. tostring(err)
      end
      pending = pending - 1
    end)
  end
end

assert(vim.wait(300000, function() return pending == 0 end, 200),
  "Timed out waiting for Mason LSP installations (" .. pending .. " unfinished)")
assert(#errors == 0, "Mason LSP installation failed: " .. table.concat(errors, "; "))
dofile(vim.g.nvim_fusion_root .. "/tests/lsp_install_test.lua")
