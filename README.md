# NVIM FUSION 🚀

## Configuração moderna do Neovim

Uma configuração modular do Neovim focada em produtividade, performance e experiência visual, construída com Lua e plugins cuidadosamente selecionados.

![Neovim](https://img.shields.io/badge/Neovim-%3E%3D%200.9.0-57A6FF?style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-5.1%2B-8A6FFF?style=for-the-badge&logo=lua&logoColor=white)
![MIT](https://img.shields.io/github/license/XzGuuhXz/Nvim-Fusion?style=for-the-badge&color=BB9AF7)
![Stars](https://img.shields.io/github/stars/XzGuuhXz/Nvim-Fusion?style=for-the-badge&logo=github&logoColor=white&color=7AA2F7)
![Last Commit](https://img.shields.io/github/last-commit/XzGuuhXz/Nvim-Fusion?style=for-the-badge&color=7DCFFF)

> **NVIM FUSION v1.0.0** — uma configuração para transformar o Neovim em um ambiente de desenvolvimento completo sem perder sua flexibilidade.

---

## 📖 Índice

- [🎯 Sobre](#-sobre)
- [✨ Características](#-características)
- [🆕 O que mudou](#-o-que-mudou)
- [📦 Compatibilidade](#-compatibilidade)
- [🛠️ Stack](#️-stack)
- [🚀 Instalação](#-instalação)
- [🗂️ Estrutura](#️-estrutura)
- [⌨️ Atalhos principais](#️-atalhos-principais)
- [🧠 LSP](#-lsp)
- [🎨 Personalização](#-personalização)
- [🔧 Troubleshooting](#-troubleshooting)
- [🤝 Contribuindo](#-contribuindo)
- [📄 Licença](#-licença)

---

## 🎯 Sobre

**NVIM FUSION** é uma configuração modular do Neovim construída em Lua, usando Lazy.nvim para gerenciamento de plugins e ferramentas voltadas para desenvolvimento moderno.

### Filosofia

- ⚡ **Performance** — carregamento lazy e configuração organizada
- 🧩 **Modularidade** — responsabilidades separadas por área
- 🎨 **Experiência visual** — TokyoNight e suporte a Nerd Font
- 🚀 **Produtividade** — LSP, fuzzy finding, Git e automações de edição

---

## ✨ Características

| Categoria | Recursos | Descrição |
|---|---|---|
| 🎨 **Interface Visual** | TokyoNight, Lualine, Bufferline, NvimTree, Dashboard | Interface moderna e organizada |
| 🔍 **Navegação** | Telescope, Which-Key, Treesitter | Busca, navegação e exploração de código |
| 🧠 **LSP** | Mason, nvim-lspconfig, nvim-cmp, LuaSnip | Completion, diagnósticos e navegação semântica |
| 🛠️ **Dev Tools** | Gitsigns, Autopairs, Comment.nvim | Git e produtividade durante a edição |

---

## 🆕 O que mudou

> [!NOTE]
> **v1.0.0 — versão estável**

- ⚡ Migração completa para **Lazy.nvim**
- 🟦 Suporte a **TypeScript**
- 🎨 **Lualine redesenhada**
- 🩺 Sistema de **diagnósticos unificado**
- 🌳 Integração completa com **Treesitter**
- 🎯 Sistema de **snippets aprimorado**
- 📦 Estrutura de plugins reorganizada
- 🚀 Melhorias de performance
- 📝 Documentação expandida

---

## 📦 Compatibilidade

| Sistema | Status | Observação |
|---|---|---|
| 🐧 Linux | ✅ Suportado | Debian, Ubuntu, Arch e Fedora |
| 🍎 macOS | ✅ Suportado | Homebrew recomendado |
| 🪟 Windows | ⚠️ Parcial | WSL2 recomendado |
| 📱 Termux | 🔶 Experimental | Pode exigir ajustes |

---

## 🛠️ Stack

- **Neovim:** `>= 0.9.0`
- **Lua:** `5.1+`
- **Plugin manager:** Lazy.nvim
- **LSP:** Mason + nvim-lspconfig
- **Completion:** nvim-cmp + LuaSnip
- **Busca:** Telescope
- **Syntax:** Treesitter
- **Git:** Gitsigns
- **UI:** TokyoNight + Lualine + Bufferline + NvimTree

---

## 🚀 Instalação

### 📋 Pré-requisitos

- Neovim `>= 0.9.0`
- Git
- Node.js + npm
- ripgrep
- Nerd Font recomendada para os ícones

<details>
<summary>🐧 Debian / Ubuntu</summary>

```bash
sudo apt update
sudo apt install git nodejs npm ripgrep
```

</details>

<details>
<summary>🏹 Arch Linux</summary>

```bash
sudo pacman -S git nodejs npm ripgrep
```

</details>

<details>
<summary>🎩 Fedora</summary>

```bash
sudo dnf install git nodejs npm ripgrep
```

</details>

<details>
<summary>🍎 macOS</summary>

```bash
brew install git node ripgrep
```

</details>

<details>
<summary>🪟 Windows / WSL2</summary>

No WSL2, instale as dependências usando o gerenciador da sua distribuição Linux e siga a instalação abaixo.

</details>

<details>
<summary>📱 Termux</summary>

```bash
pkg update
pkg install git nodejs ripgrep
```

> Suporte experimental.

</details>

### 📥 Instalação

Faça backup antes de substituir uma configuração existente:

```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

Clone o projeto:

```bash
git clone https://github.com/XzGuuhXz/Nvim-Fusion.git ~/.config/nvim
```

Inicie:

```bash
nvim
```

O Lazy.nvim fará o bootstrap e instalará os plugins configurados.

### ✅ Verificação

Dentro do Neovim:

```vim
:checkhealth
:Lazy
:Mason
```

<details>
<summary>🔧 Troubleshooting</summary>

Para testar o Neovim sem sua configuração:

```bash
nvim --clean
```

Depois, na configuração Fusion:

```vim
:checkhealth
:Lazy sync
:Mason
```

</details>

---

## 🗂️ Estrutura

```text
~/.config/nvim/
├── init.lua
├── LICENSE
├── README.md
└── lua/
    └── plugins/
        ├── lsp/
        │   └── init.lua
        ├── tools/
        │   └── init.lua
        ├── ui/
        │   └── init.lua
        └── util/
            └── init.lua
```

### Organização

- `init.lua` → entrada principal e bootstrap
- `plugins/lsp/` → LSP, completion e diagnósticos
- `plugins/tools/` → Telescope, Treesitter e ferramentas
- `plugins/ui/` → tema e interface
- `plugins/util/` → utilidades de edição

---

## ⌨️ Atalhos principais

> `<leader>` = **Espaço**

| Atalho | Função |
|---|---|
| `<leader>w` | Salvar arquivo |
| `<leader>q` | Sair |
| `<leader>pv` | Explorador nativo |
| `<leader>ff` | Buscar arquivos |
| `<leader>fg` | Buscar texto |
| `<leader>fb` | Listar buffers |
| `gd` | Ir para definição |
| `K` | Mostrar documentação |

---

## 🧠 LSP

Servidores definidos pelo projeto:

```text
lua_ls
pyright
ts_ls
jsonls
html
cssls
clangd
```

A integração utiliza Mason, nvim-lspconfig, nvim-cmp, LuaSnip e os diagnósticos do Neovim.

---

## 🎨 Personalização

O tema principal é **TokyoNight**, com suporte visual pensado para Nerd Fonts.

Configurações básicas:

```lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.backup = false
```

---

## 🔧 Comandos úteis

```vim
:Lazy sync
:Lazy
:Mason
:checkhealth
```

Atualizar a configuração pelo Git:

```bash
cd ~/.config/nvim
git pull origin main
```

---

## 🤝 Contribuindo

Contribuições, sugestões e correções são bem-vindas.

1. Faça um fork.
2. Crie uma branch para sua alteração.
3. Faça commits pequenos e descritivos.
4. Teste a configuração.
5. Abra um Pull Request.

Exemplos:

```text
feat: adiciona novo plugin
fix: corrige configuração do LSP
docs: atualiza documentação
refactor: reorganiza módulos
```

---

## 📄 Licença

Distribuído sob a **MIT License**.

---

<div align="center">

### ⚡ Feito com 💙 usando Neovim

<img src="https://komarev.com/ghpvc/?username=XzGuuhXz&repo=Nvim-Fusion&label=VIEWS&color=7AA2F7&style=for-the-badge" alt="Repository views">

<br>

`Lua` · `Lazy.nvim` · `LSP` · `Treesitter` · `Telescope` · `Git`

</div>
