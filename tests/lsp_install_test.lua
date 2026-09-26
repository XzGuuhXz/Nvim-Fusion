-- Run after scripts/bootstrap_lsp.lua in a fresh XDG environment.
local registry = require("mason-registry")
local mappings = require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package
for _, server in ipairs(require("config.servers")) do
  local package_name = assert(mappings[server], "No Mason mapping: " .. server)
  local package = registry.get_package(package_name)
  assert(package:is_installed(), "LSP not installed: " .. server .. " (" .. package_name .. ")")
  local cmd = vim.lsp.config[server].cmd
  if type(cmd) == "table" then
    assert(vim.fn.executable(cmd[1]) == 1, "LSP executable missing: " .. cmd[1])
  end
end
print("All seven LSP packages installed and executables available")
