-- lua/config/benchmark.lua
-- Sistema de benchmark opcional da configuração.

local M = {}
local uv = vim.uv

function M.measure_startup()
  local start_time = uv.hrtime()
  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("BenchmarkStartup", { clear = true }),
    callback = function()
      local duration = (uv.hrtime() - start_time) / 1e6
      vim.g.last_startup_time = duration
      if vim.g.show_startup_time then
        print(string.format("🚀 Neovim iniciado em %.2fms", duration))
      end
    end,
  })
end

function M.count_plugins()
  local ok, lazy = pcall(require, "lazy")
  if not ok then
    return { loaded = 0, total = 0, error = "Lazy não encontrado" }
  end

  local stats = lazy.stats()
  return {
    loaded = stats.loaded or 0,
    total = stats.count or 0,
  }
end

function M.measure_memory()
  collectgarbage("collect")
  local lua_memory = collectgarbage("count")
  return {
    lua_memory_kb = math.floor(lua_memory),
    lua_memory_mb = math.floor(lua_memory / 1024 * 100) / 100,
  }
end

function M.show_all()
  local plugins = M.count_plugins()
  local memory = M.measure_memory()
  local separator = "═══════════════════════════════════════════════════════════"

  print("\n" .. separator)
  print("🚀   RELATÓRIO COMPLETO DA CONFIGURAÇÃO NEOVIM   🚀")
  print(separator)

  print("\n📊 PERFORMANCE:")
  print(string.format("   🚀 Tempo de startup: %.2fms", vim.g.last_startup_time or 0))
  print(string.format("   🧠 Memória Lua: %.2f MB (%.0f KB)", memory.lua_memory_mb, memory.lua_memory_kb))

  print("\n🔌 PLUGINS:")
  if plugins.error then
    print("   ❌ Erro: " .. plugins.error)
  else
    local lazy_count = math.max(plugins.total - plugins.loaded, 0)
    print(string.format("   📦 Total: %d", plugins.total))
    print(string.format("   ✅ Carregados: %d (%.1f%%)", plugins.loaded, plugins.total > 0 and plugins.loaded / plugins.total * 100 or 0))
    print(string.format("   💤 Lazy: %d (%.1f%%)", lazy_count, plugins.total > 0 and lazy_count / plugins.total * 100 or 0))
  end

  print("\n🖥️  SISTEMA:")
  local uname = uv.os_uname()
  print("   💻 OS: " .. uname.sysname .. " " .. (uname.release or ""))
  print("   🏗️  Arquitetura: " .. (uname.machine or "desconhecida"))
  local version = vim.version()
  print(string.format("   🔧 Neovim: v%d.%d.%d", version.major, version.minor, version.patch))
  print("   🌙 Lua: " .. _VERSION)

  print("\n⚙️  CONFIGURAÇÃO:")
  print("   📂 Config path: " .. vim.fn.stdpath("config"))
  print("   📦 Data path: " .. vim.fn.stdpath("data"))
  print("   🎨 Colorscheme: " .. (vim.g.colors_name or "default"))
  print("   👤 Leader key: " .. (vim.g.mapleader or "\\"))

  print("\n🛠️  LSP:")
  local clients = vim.lsp.get_clients()
  if #clients == 0 then
    print("   📡 Nenhum servidor LSP ativo")
  else
    print(string.format("   📡 Servidores ativos: %d", #clients))
    for _, client in ipairs(clients) do
      local buffers = vim.tbl_keys(client.attached_buffers or {})
      print(string.format("     └─ %s (%d buffers)", client.name, #buffers))
    end
  end

  print("\n📄 SESSÃO ATUAL:")
  local buffers = vim.api.nvim_list_bufs()
  local loaded_buffers = vim.tbl_filter(vim.api.nvim_buf_is_loaded, buffers)
  print(string.format("   📄 Buffers: %d carregados / %d total", #loaded_buffers, #buffers))
  print(string.format("   🪟 Windows: %d", #vim.api.nvim_tabpage_list_wins(0)))
  print(string.format("   📑 Tab pages: %d", #vim.api.nvim_list_tabpages()))

  print("\n⌨️  KEYMAPS:")
  print(string.format("   🔤 Normal mode: %d", #vim.api.nvim_get_keymap("n")))
  print(string.format("   ✏️  Insert mode: %d", #vim.api.nvim_get_keymap("i")))
  print(string.format("   👁️  Visual mode: %d", #vim.api.nvim_get_keymap("v")))

  print("\n🎯 FEATURES ATIVAS:")
  print("   " .. (vim.g.loaded_netrw and "❌" or "✅") .. " netrw disabled")
  print("   " .. (vim.opt.number:get() and "✅" or "❌") .. " line numbers")
  print("   " .. (vim.opt.relativenumber:get() and "✅" or "❌") .. " relative numbers")
  print("   " .. (vim.opt.signcolumn:get() ~= "no" and "✅" or "❌") .. " sign column")
  print("   " .. (vim.opt.termguicolors:get() and "✅" or "❌") .. " true colors")
  print("   " .. (vim.opt.clipboard:get()[1] and "✅" or "❌") .. " system clipboard")
  print("\n" .. separator .. "\n")
end

function M.show_stats()
  local plugins = M.count_plugins()
  local memory = M.measure_memory()
  print("📊 === ESTATÍSTICAS DA CONFIGURAÇÃO ===")
  print(string.format("🚀 Último startup: %.2fms", vim.g.last_startup_time or 0))
  if plugins.error then
    print("🔌 Plugins: " .. plugins.error)
  else
    print(string.format("🔌 Plugins: %d carregados / %d total (%.1f%%)", plugins.loaded, plugins.total, plugins.total > 0 and plugins.loaded / plugins.total * 100 or 0))
  end
  print(string.format("🧠 Memória Lua: %.2f MB", memory.lua_memory_mb))
  print("=====================================")
end

function M.simple_benchmark()
  M.show_stats()
  local uname = uv.os_uname()
  local version = vim.version()
  print("\n🖥️  Sistema:")
  print(string.format("  Neovim: %d.%d.%d", version.major, version.minor, version.patch))
  print("  Lua: " .. _VERSION)
  print("  OS: " .. uname.sysname)
end

function M.setup_commands()
  vim.api.nvim_create_user_command("BenchmarkAll", M.show_all, { desc = "Mostrar informações da configuração" })
  vim.api.nvim_create_user_command("BenchmarkStats", M.show_stats, { desc = "Mostrar estatísticas de performance" })
  vim.api.nvim_create_user_command("BenchmarkSimple", M.simple_benchmark, { desc = "Benchmark simples" })
  vim.api.nvim_create_user_command("BenchmarkStartup", function()
    if vim.g.last_startup_time then
      print(string.format("🚀 Último tempo de startup: %.2fms", vim.g.last_startup_time))
    else
      print("❌ Tempo de startup não disponível (reinicie o Neovim)")
    end
  end, { desc = "Mostrar tempo do último startup" })
  vim.api.nvim_create_user_command("BenchmarkToggleStartup", function()
    vim.g.show_startup_time = not vim.g.show_startup_time
    print("🔧 Mostrar tempo de startup: " .. (vim.g.show_startup_time and "ativado" or "desativado"))
  end, { desc = "Ativar/desativar exibição do tempo de startup" })
end

function M.setup()
  M.measure_startup()
  M.setup_commands()
end

return M
