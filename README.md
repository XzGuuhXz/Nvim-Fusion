# NVIM FUSION 🚀

> Uma configuração modular, moderna e neon-cyberpunk para Neovim, focada em produtividade, LSP, navegação de código e uma identidade visual própria.

[![Neovim](https://img.shields.io/badge/Neovim-0.12%2B-57A6FF?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Lua](https://img.shields.io/badge/Lua-5.1%2B-8A6FFF?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)
[![License](https://img.shields.io/github/license/XzGuuhXz/Nvim-Fusion?style=for-the-badge)](LICENSE)
[![Last Commit](https://img.shields.io/github/last-commit/XzGuuhXz/Nvim-Fusion?style=for-the-badge&logo=github)](https://github.com/XzGuuhXz/Nvim-Fusion/commits/main)

## ✨ Sobre

**NVIM FUSION** é uma configuração pessoal de Neovim transformada em um projeto aberto para quem quer um ambiente de desenvolvimento pronto, modular e fácil de modificar.

A configuração usa **Lazy.nvim**, **Mason**, **LSP**, **nvim-cmp**, **Treesitter**, **Telescope**, **NvimTree**, **Gitsigns** e uma identidade visual própria chamada **NVIM FUSION v2 Neon Cyberpunk**.

### Filosofia

- ⚡ Performance com carregamento lazy
- 🧩 Configuração modular por responsabilidade
- 🎨 Tema próprio em roxo, violeta, magenta e fúcsia
- 🧠 LSP e completion para desenvolvimento moderno
- 🌳 Treesitter para destaque e estrutura de código
- 🔎 Telescope para busca e navegação
- 🌲 NvimTree para exploração de arquivos
- 󰊢 Gitsigns para integração visual com Git
- 🔤 Nerd Font para uma interface rica em ícones

## 📦 Requisitos

| Requisito | Versão / observação |
|---|---|
| Neovim | **0.12+** |
| Git | Necessário para o Lazy.nvim |
| Nerd Font | Recomendada para os ícones |
| ripgrep | Recomendado para buscas do Telescope |
| Node.js | Necessário para alguns LSPs, conforme a linguagem |
| Python | Necessário para o Pyright, conforme sua instalação |
| C/C++ toolchain | Necessário para clangd e compilação de projetos |
| tree-sitter CLI | Recomendado para instalação/atualização dos parsers |

> O projeto foi atualizado para APIs modernas do Neovim. Versões antigas do Neovim não são suportadas.

## 🚀 Instalação

### 1. Faça backup da configuração atual

```bash
mv ~/.config/nvim ~/.config/nvim.backup-$(date +%Y%m%d-%H%M%S)
```

Se quiser preservar também dados e plugins anteriores:

```bash
mv ~/.local/share/nvim ~/.local/share/nvim.backup-$(date +%Y%m%d-%H%M%S)
```

### 2. Clone o NVIM FUSION

```bash
git clone https://github.com/XzGuuhXz/Nvim-Fusion.git ~/.config/nvim
```

### 3. Inicie o Neovim

```bash
nvim
```

O Lazy.nvim será inicializado automaticamente e instalará os plugins configurados.

### 4. Verifique a instalação

Dentro do Neovim:

```vim
:checkhealth
:Lazy
:Mason
```

## 🐧 Distribuições Linux

### Debian / Ubuntu

```bash
sudo apt update
sudo apt install git ripgrep nodejs npm build-essential
```

### Arch Linux

```bash
sudo pacman -S git ripgrep nodejs npm base-devel
```

### Fedora

```bash
sudo dnf install git ripgrep nodejs npm gcc gcc-c++ make
```

> O Neovim 0.12+ deve ser instalado separadamente caso a versão disponível no repositório da distribuição seja antiga.

## 🎨 Identidade visual

O **NVIM FUSION v2 Neon Cyberpunk** usa uma paleta própria baseada em:

- `#08050D` — Void
- `#0D0816` — Abyss
- `#130B20` — Panel
- `#C77DFF` — Neon Violet
- `#E879F9` — Neon Fuchsia
- `#A78BFA` — Violet
- `#F0ABFC` — Fuchsia
- `#F472B6` — Pink

A interface também utiliza transparência quando o terminal oferece suporte e possui uma statusline global personalizada com Lualine.

## 🧩 Principais componentes

| Área | Tecnologia |
|---|---|
| Plugin manager | Lazy.nvim |
| LSP | nvim-lspconfig + Mason |
| Completion | nvim-cmp + LuaSnip |
| Syntax | nvim-treesitter |
| Busca | Telescope |
| Arquivos | NvimTree |
| Git | Gitsigns |
| Statusline | Lualine |
| Tabs | Bufferline |
| Key hints | Which-Key |
| Diagnósticos | Neovim Diagnostic API |
| Tema | NVIM FUSION v2 |

## 🧠 LSP incluído

A configuração prepara os seguintes servidores:

```text
lua_ls
pyright
ts_ls
jsonls
html
cssls
clangd
```

O Mason gerencia a instalação desses servidores, enquanto a configuração do NVIM FUSION controla explicitamente sua ativação através da API moderna de LSP do Neovim.

## ⌨️ Atalhos principais

`<leader>` = **Espaço**

### Arquivos e busca

| Atalho | Ação |
|---|---|
| `<leader>e` | Abrir/fechar NvimTree |
| `<leader>o` | Focar NvimTree |
| `<leader>fe` | Encontrar arquivo no explorer |
| `<leader>ff` | Buscar arquivos |
| `<leader>fg` | Live grep |
| `<leader>fb` | Listar buffers |
| `<leader>pf` | Buscar arquivos |
| `<leader>ps` | Buscar palavra |
| `<leader>pb` | Listar buffers |
| `<C-p>` | Arquivos Git |

### LSP

| Atalho | Ação |
|---|---|
| `gd` | Ir para definição |
| `gD` | Ir para declaração |
| `gi` | Ir para implementação |
| `gr` | Referências |
| `K` | Documentação/hover |
| `<leader>rn` | Renomear símbolo |
| `<leader>ca` | Code action |
| `<leader>lf` | Formatar código |
| `<leader>ls` | Signature help |
| `[d` | Diagnóstico anterior |
| `]d` | Próximo diagnóstico |
| `<leader>d` | Mostrar diagnóstico |

### Editor

| Atalho | Ação |
|---|---|
| `<leader>w` | Salvar |
| `<leader>q` | Sair |
| `<leader>pv` | Explorer nativo |
| `<C-h/j/k/l>` | Navegar entre janelas |
| `<` / `>` | Indentar seleção mantendo seleção |
| `J` / `K` | Mover linhas no modo visual |

## 🗂️ Estrutura

```text
~/.config/nvim/
├── init.lua
├── LICENSE
├── README.md
├── .gitignore
├── colors/
│   └── nvim-fusion.lua
├── tests/
│   └── theme_test.lua
└── lua/
    ├── config/
    │   ├── init.lua
    │   ├── options.lua
    │   ├── keymaps.lua
    │   ├── diagnostics.lua
    │   ├── lsp.lua
    │   └── lazy.lua
    └── plugins/
        ├── init.lua
        ├── lsp/
        ├── treesitter/
        ├── editor/
        ├── ui/
        ├── git/
        └── util/
```

## 🧪 Teste o tema

O projeto possui um showcase executável para validar a identidade visual:

```bash
nvim -u init.lua +"luafile tests/theme_test.lua"
```

Ou, dentro do Neovim:

```vim
:luafile tests/theme_test.lua
```

## 🔧 Troubleshooting

### Verifique a versão do Neovim

```bash
nvim --version
```

O mínimo suportado é **0.12**.

### Verifique os plugins

```vim
:Lazy
:Lazy sync
```

### Verifique o LSP

```vim
:Mason
:LspInfo
```

### Verifique a instalação geral

```vim
:checkhealth
```

### Treesitter

Se os parsers não forem instalados automaticamente, verifique se o CLI está disponível:

```bash
tree-sitter --version
```

Depois:

```vim
:TSUpdate
```

### Problemas de ícones

Instale e configure uma **Nerd Font** no seu terminal. O NVIM FUSION não baixa fontes automaticamente.

## 🔐 Segurança

O repositório não deve conter credenciais, tokens ou configurações específicas da máquina do desenvolvedor.

Antes de enviar alterações:

```bash
git status
git diff --cached
```

Nunca faça commit de:

- API keys
- tokens de acesso
- senhas
- certificados privados
- arquivos `.env`
- arquivos de configuração pessoal
- dumps ou logs contendo dados sensíveis

O projeto inclui um `.gitignore` para reduzir o risco de arquivos locais acidentais serem versionados.

## 📌 Status do projeto

**NVIM FUSION está aberto para testes.**

A configuração é experimental e pode exigir ajustes dependendo do sistema operacional, terminal, fonte e ferramentas instaladas.

Se encontrar um problema, abra uma Issue informando:

1. Sistema operacional
2. Versão do Neovim (`nvim --version`)
3. Saída de `:checkhealth`
4. Erro exibido no Neovim
5. Etapas para reproduzir o problema

## 🤝 Contribuindo

Pull requests, issues, sugestões de plugins e melhorias são bem-vindos.

Antes de abrir um PR:

```bash
git diff
```

Teste a configuração em uma instalação limpa sempre que possível.

Sugestões de commits:

```text
feat: adiciona suporte a novo recurso
fix: corrige configuração do LSP
docs: atualiza documentação
refactor: reorganiza módulos
chore: atualiza dependências
```

## 📄 Licença

Distribuído sob a **MIT License**. Consulte o arquivo [LICENSE](LICENSE).

---

<div align="center">

**NVIM FUSION 🚀**

`Lua` · `Lazy.nvim` · `LSP` · `Treesitter` · `Telescope` · `Git` · `Neon Cyberpunk`

</div>
