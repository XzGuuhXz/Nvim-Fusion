# Nvim-Fusion

Configuração modular do Neovim, organizada por responsabilidade e preparada para Neovim moderno.

## Requisitos

- **Neovim 0.12+** — a branch atual usa a reescrita `main` do nvim-treesitter.
- **Git** — para bootstrap do lazy.nvim e instalação dos plugins.
- **tree-sitter-cli 0.26.1+** — necessário para os parsers do nvim-treesitter atual.
- **Compilador C** — necessário para compilar parsers quando aplicável.
- **curl** e **tar** — usados pelo fluxo atual do nvim-treesitter.
- **Nerd Font** — recomendado para os ícones da interface.
- **ripgrep** e **fd** — recomendados para aproveitar melhor o Telescope.

> Os servidores LSP são gerenciados pelo Mason. Algumas linguagens também exigem runtimes externos, como Node.js, Python, Rust ou Java.

## Instalação

Faça backup da configuração existente antes de instalar.

```bash
git clone <URL-DO-REPOSITORIO> ~/.config/nvim
nvim
```

Na primeira inicialização, o lazy.nvim será instalado automaticamente e os plugins serão sincronizados conforme a configuração.

## Estrutura

```text
.
├── init.lua
├── lua/
│   ├── config/
│   │   ├── autocmds.lua
│   │   ├── benchmark.lua
│   │   ├── init.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
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
└── .gitignore
```

## LSP

A configuração usa `nvim-lspconfig` com a API nativa moderna do Neovim (`vim.lsp.config`) e integração com Mason/Mason-LSPConfig.

Servidores configurados para instalação automática:

- Lua: `lua_ls`
- Python: `pyright`
- JavaScript/TypeScript: `ts_ls`
- HTML: `html`
- CSS: `cssls`
- JSON: `jsonls`
- YAML: `yamlls`
- Bash: `bashls`
- C/C++: `clangd`
- Rust: `rust_analyzer`
- Java: `jdtls`

Atalhos LSP principais:

| Atalho | Ação |
|---|---|
| `gd` | Definição |
| `gD` | Declaração |
| `gi` | Implementação |
| `gr` | Referências |
| `K` | Hover |
| `<C-k>` | Signature help |
| `<leader>rn` | Renomear |
| `<leader>ca` | Code action |
| `<leader>lf` | Formatar buffer |
| `[d` / `]d` | Diagnóstico anterior/próximo |

## Treesitter

A configuração usa a arquitetura atual do nvim-treesitter, sem a API antiga `nvim-treesitter.configs`.

Os parsers são instalados por `require("nvim-treesitter").install(...)` e o highlighting é iniciado por buffer. Depois de atualizar o plugin, execute:

```vim
:TSUpdate
```

## Plugins principais

- **lazy.nvim** — gerenciador de plugins
- **Mason + mason-lspconfig** — instalação e integração de ferramentas LSP
- **nvim-lspconfig** — configurações dos servidores LSP
- **nvim-cmp + LuaSnip** — completion e snippets
- **nvim-treesitter** — parsing e highlighting
- **Telescope** — busca fuzzy
- **nvim-tree** — explorador de arquivos
- **Trouble** — diagnósticos e símbolos
- **Gitsigns** — integração visual com Git
- **Lualine + Bufferline + Alpha** — interface
- **TokyoNight** — tema
- **Which-Key** — descoberta de atalhos
- **nvim-colorizer** — visualização de cores
- **indent-blankline** — guias de indentação
- **nvim-autopairs** — fechamento automático de pares

## Atalhos gerais

- `<leader>pv` — abrir netrw
- `<leader>fs` — salvar
- `<leader>qq` — sair da janela
- `<C-h/j/k/l>` — navegar entre janelas
- `<leader>e` — alternar nvim-tree
- `<leader>o` — focar nvim-tree
- `<leader>nf` — localizar arquivo no nvim-tree
- `<leader>ff` — encontrar arquivos
- `<leader>fg` — busca por texto
- `<leader>fb` — buffers
- `<leader>fh` — ajuda
- `<leader>xx` — Trouble/diagnósticos

## Segurança e manutenção

- Arquivos `.env` e temporários são ignorados pelo Git.
- Não coloque tokens, senhas, chaves privadas ou credenciais na configuração.
- A configuração não executa comandos shell derivados de entrada do usuário.
- O explorador de arquivos foi consolidado em **nvim-tree** para evitar manter dois plugins com a mesma finalidade.
- A configuração evita a API legada `require("lspconfig")`.

## Verificação

No ambiente local, depois de instalar os requisitos:

```bash
nvim --version
nvim --clean
```

E, com a configuração carregada:

```vim
:checkhealth
:checkhealth vim.deprecated
:Lazy
:Mason
```

> Esta auditoria foi feita estaticamente no repositório. O ambiente desta sessão não permitiu executar o Neovim e seus plugins, portanto ainda é necessário fazer a validação runtime local com `:checkhealth` e uma inicialização real.

## Licença

MIT.
