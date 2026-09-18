local lock = vim.json.decode(table.concat(vim.fn.readfile(vim.g.nvim_fusion_root .. "/lazy-lock.json"), "\n"))
local plugins = require("lazy.core.config").plugins
for name, entry in pairs(lock) do
  local plugin = assert(plugins[name], "Missing locked plugin: " .. name)
  local result = vim.system({ "git", "-C", plugin.dir, "rev-parse", "HEAD" }, { text = true }):wait()
  assert(result.code == 0, "Plugin is not installed: " .. name)
  assert(vim.trim(result.stdout) == entry.commit, "Plugin differs from lock: " .. name)
end
print("All locked plugin revisions verified")
