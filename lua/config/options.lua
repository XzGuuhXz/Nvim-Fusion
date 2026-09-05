-- =========================
-- 🧭 Mapeamento de líderes
-- =========================
vim.g.mapleader = " "          -- Líder global: espaço
vim.g.maplocalleader = " "     -- Líder local: espaço

-- =========================
-- 📜 Aparência e Interface
-- =========================
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "0"
vim.opt.showmode = false
vim.opt.termguicolors = true

-- =========================
-- ✍️ Tabulação e Indentação
-- =========================
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- =========================
-- 📜 Quebra e rolagem
-- =========================
vim.opt.wrap = false
vim.opt.scrolloff = 8

-- =========================
-- 🔍 Busca
-- =========================
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- =========================
-- 📋 Clipboard
-- =========================
vim.opt.clipboard = "unnamedplus"

-- =========================
-- 💾 Arquivos e Backup
-- =========================
vim.opt.swapfile = false
vim.opt.backup = false

-- =========================
-- ⚡ Performance
-- =========================
-- 200ms evita disparos excessivos de CursorHold, mantendo a UI responsiva.
vim.opt.updatetime = 200
