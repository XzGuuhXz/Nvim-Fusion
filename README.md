# ⚡ Nvim-Fusion

> Uma configuração moderna, modular e performática para transformar o **Neovim** em um ambiente completo de desenvolvimento.

[![Neovim](https://img.shields.io/badge/Neovim-0.12%2B-57A143?style=flat-square&logo=neovim)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-5.1%2B-2C2D72?style=flat-square&logo=lua)](https://www.lua.org/)
[![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](LICENSE)
[![Plugins](https://img.shields.io/badge/plugins-Lazy.nvim-orange?style=flat-square)](https://github.com/folke/lazy.nvim)

## ✨ Sobre o projeto

O **Nvim-Fusion** é uma configuração modular do Neovim focada em produtividade, desenvolvimento e facilidade de manutenção.

A configuração separa responsabilidades entre `config/` e `plugins/`, utiliza carregamento sob demanda quando apropriado e adota APIs modernas do ecossistema Neovim.

### Destaques

- 🧩 Arquitetura modular e organizada
- ⚡ Lazy loading com **lazy.nvim**
- 🧠 LSP, completion e snippets
- 🌳 Treesitter para parsing e syntax highlighting
- 🔧 Mason para instalação e gerenciamento de ferramentas
- 🔎 Telescope para busca e navegação
- 🌿 Gitsigns para integração com Git
- 🚨 Trouble para diagnósticos e símbolos
- 🎨 TokyoNight + Lualine + Bufferline + Alpha
- 📁 NvimTree como explorador de arquivos
- ⌨️ Which-Key para descoberta de atalhos
- 🛡️ Configuração com foco em segurança, previsibilidade e manutenção

---

## 📋 Requisitos

A configuração desta branch acompanha APIs modernas e requer:

- **Neovim 0.12+**
- **Git**
- **tree-sitter-cli 0.26.1+**
- **Compilador C** — GCC ou Clang
- **curl** e **tar**
- **Nerd Font** — recomendado para os ícones
- **ripgrep** e **fd** — recomendados para o Telescope

Alguns servidores LSP também exigem runtimes específicos, como Node.js, Python, Rust ou Java.

> **Importante:** o `nvim-treesitter` desta branch segue a arquitetura atual. Se você estiver usando Neovim 0.11 ou anterior, atualize o Neovim antes de instalar esta configuração.

---

## 🚀 Instalação

### 1. Faça backup da configuração atual

```bash
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
```

### 2. Clone o projeto

```bash
git clone https://github.com/XzGuuhXz/Nvim-Fusion.git ~/.config/nvim
cd ~/.config/nvim
git checkout xzguuhxz
```

> Se o repositório já estiver clonado, use `git fetch` e depois `git switch xzguuhxz` para acessar esta branch.

### 3. Inicie o Neovim

```bash
nvim
```

Na primeira inicialização, o `lazy.nvim` será preparado e os plugins serão carregados conforme a configuração.

### Atualização

Dentro do Neovim:

```vim
:Lazy sync
:TSUpdate
```

---

## 🗂️ Estrutura do projeto

```text
Nvim-Fusion/
├── init.lua
├── lua/
│   ├── config/
│   │   ├── autocmds.lua
│   │   ├── benchmark.lua
│   │   ├── init.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   │
│   └── plugins/
│       ├── completion/
│       │   └── nvim-cmp.lua
│       ├── core/
│       │   ├── autopairs.lua
│       │   ├── lsp.lua
│       │   ├── lspkind.lua
│       │   ├── treesitter.lua
│       │   └── trouble.lua
│       ├── editor/
│       │   ├── nvim-tree.lua
│       │   ├── telescope.lua
│       │   └── which-key.lua
│       ├── git/
│       │   └── gitsigns.lua
│       └── ui/
│           ├── alpha.lua
│           ├── bufferline.lua
│           ├── colorizer.lua
│           ├── indent-blankline.lua
│           ├── lualine.lua
│           └── tokyonight.lua
│
├── LICENSE
└── .gitignore
```

A organização mantém configurações gerais em `lua/config/` e configurações de plugins em `lua/plugins/`, separadas por responsabilidade.

---

## 🧠 LSP

O LSP utiliza a API moderna do Neovim em conjunto com **Mason** e **mason-lspconfig**.

### Servidores configurados

| Linguagem | Server |
|---|---|
| Lua | `lua_ls` |
| Python | `pyright` |
| JavaScript / TypeScript | `ts_ls` |
| HTML | `html` |
| CSS | `cssls` |
| JSON | `jsonls` |
| YAML | `yamlls` |
| Bash | `bashls` |
| C / C++ | `clangd` |
| Rust | `rust_analyzer` |
| Java | `jdtls` |

### Atalhos LSP

| Atalho | Ação |
|---|---|
| `gd` | Ir para definição |
| `gD` | Ir para declaração |
| `gi` | Ir para implementação |
| `gr` | Mostrar referências |
| `gt` | Ir para definição de tipo |
| `K` | Documentação / Hover |
| `<C-k>` | Signature help |
| `<leader>rn` | Renomear símbolo |
| `<leader>ca` | Code action |
| `<leader>lf` | Formatar buffer |
| `[d` / `]d` | Diagnóstico anterior / próximo |
| `<leader>ld` | Mostrar diagnóstico |

---

## 🌳 Treesitter

A configuração utiliza a arquitetura atual do `nvim-treesitter`.

Os parsers são instalados pela configuração usando a API atual:

```lua
require("nvim-treesitter").install(...)
```

Após atualizar o Treesitter, execute:

```vim
:TSUpdate
```

---

## 🔌 Plugins

### Core

- [lazy.nvim](https://github.com/folke/lazy.nvim) — gerenciamento de plugins
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) — configurações LSP
- [mason.nvim](https://github.com/mason-org/mason.nvim) — instalação de ferramentas
- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) — integração Mason/LSP
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — parsing
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) — completion
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) — snippets

### Interface

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) — tema
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) — statusline
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) — buffers
- [alpha-nvim](https://github.com/goolord/alpha-nvim) — dashboard
- [which-key.nvim](https://github.com/folke/which-key.nvim) — atalhos
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) — ícones

### Ferramentas

- [Telescope](https://github.com/nvim-telescope/telescope.nvim) — busca e navegação
- [NvimTree](https://github.com/nvim-tree/nvim-tree.lua) — explorador de arquivos
- [Trouble](https://github.com/folke/trouble.nvim) — diagnósticos e símbolos
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) — integração com Git
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) — fechamento automático
- [nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua) — visualização de cores
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) — guias de indentação

---

## ⌨️ Atalhos principais

| Atalho | Ação |
|---|---|
| `<leader>pv` | Abrir explorador / netrw |
| `<leader>fs` | Salvar arquivo |
| `<leader>qq` | Fechar janela |
| `<C-h>` | Janela à esquerda |
| `<C-j>` | Janela abaixo |
| `<C-k>` | Janela acima |
| `<C-l>` | Janela à direita |
| `<leader>e` | Alternar NvimTree |
| `<leader>o` | Focar NvimTree |
| `<leader>nf` | Localizar arquivo no NvimTree |
| `<leader>ff` | Encontrar arquivos |
| `<leader>fg` | Buscar texto |
| `<leader>fb` | Listar buffers |
| `<leader>fh` | Abrir ajuda |
| `<leader>xx` | Diagnósticos no Trouble |
| `<leader>xX` | Diagnósticos do buffer |

---

## ⚡ Performance

A configuração utiliza carregamento sob demanda para reduzir trabalho durante o startup quando isso é seguro.

Para analisar a configuração:

```vim
:NvimBenchmark
:NvimBenchmarkPlugins
:NvimBenchmarkMemory
```

> Os resultados dependem do hardware, sistema operacional, versão do Neovim e plugins instalados. As métricas não devem ser interpretadas como garantia fixa de performance.

---

## 🛡️ Segurança e boas práticas

- `.env`, arquivos temporários e artefatos locais não devem ser versionados.
- Nunca armazene tokens, senhas, chaves privadas ou credenciais no repositório.
- Instale e atualize ferramentas externas conscientemente.
- Prefira APIs modernas e evite APIs depreciadas.
- Evite plugins duplicados com a mesma finalidade para reduzir a superfície de manutenção.
- Revise plugins e executáveis externos antes de confiar neles em um ambiente de desenvolvimento.

---

## 🧪 Verificação

Depois da instalação, confira a versão do Neovim:

```bash
nvim --version
```

Dentro do Neovim, execute:

```vim
:checkhealth
:checkhealth vim.deprecated
:Lazy
:Mason
```

Se algo falhar, verifique primeiro os requisitos do sistema e as mensagens apresentadas pelo `:checkhealth`.

---

## 🤝 Contribuição

Sugestões, correções e melhorias são bem-vindas.

Antes de enviar alterações:

1. mantenha a organização modular;
2. evite APIs depreciadas;
3. não adicione credenciais ou arquivos locais;
4. teste a configuração em uma instalação limpa quando possível;
5. mantenha o README sincronizado com mudanças relevantes na configuração.

---

## 📄 Licença

Este projeto está disponível sob a licença **MIT**. Consulte o arquivo [LICENSE](LICENSE) para mais informações.

---

<div align="center">

**Nvim-Fusion** · Neovim moderno · Modular · Produtivo

</div>
