-- This runs only in a PTY with a fresh Mason directory. No MasonInstall is
-- issued: mason-lspconfig must install all servers during the first session.
local packages = {
  "lua-language-server", "pyright", "typescript-language-server",
  "json-lsp", "html-lsp", "css-lsp", "clangd",
}
local registry = require("mason-registry")
local function installed_count()
  if #registry.get_installed_package_names() < #packages then return 0 end
  local count = 0
  for _, name in ipairs(packages) do
    local ok, pkg = pcall(registry.get_package, name)
    if ok and pkg:is_installed() and not pkg:is_installing() then
      count = count + 1
    end
  end
  return count
end

assert(vim.wait(300000, function() return installed_count() == #packages end, 200),
  string.format("Automatic LSP installation incomplete: %d/%d", installed_count(), #packages))
dofile(vim.g.nvim_fusion_root .. "/tests/lsp_install_test.lua")
print("All seven LSPs auto-installed in an interactive first session")
