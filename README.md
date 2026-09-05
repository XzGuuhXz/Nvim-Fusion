# Nvim-Fusion

Configuração modular do Neovim 0.12+ com foco em produtividade, LSP, Treesitter, Git e uma interface moderna.

## Instalação

### Debian / Ubuntu

```bash
sudo apt update
sudo apt install -y git curl build-essential ripgrep fd-find
```

Instale o Neovim 0.12+ pelo método oficial da sua distribuição ou pelos binários oficiais.

### Arch / Manjaro

```bash
sudo pacman -Syu --needed git base-devel curl ripgrep fd
```

### macOS

```bash
brew install neovim git ripgrep fd
```

### Windows

Com `winget`:

```powershell
winget install Neovim.Neovim
winget install Git.Git
winget install BurntSushi.ripgrep.MSVC
winget install sharkdp.fd
```

Ou use Scoop:

```powershell
scoop install neovim git ripgrep fd
```

### Instalação universal do Neovim

Também é possível usar o tarball/AppImage oficial do Neovim. O Nvim-Fusion exige **Neovim 0.12+**.

## Nvim-Fusion

Linux/macOS:

```bash
git clone -b xzguuhxz https://github.com/XzGuuhXz/Nvim-Fusion.git ~/.config/nvim
```

Windows (PowerShell):

```powershell
git clone -b xzguuhxz https://github.com/XzGuuhXz/Nvim-Fusion.git "$env:LOCALAPPDATA\nvim"
```

Abra o Neovim e deixe o `lazy.nvim` instalar os plugins.

## Requisitos

- Neovim 0.12+
- Git
- `curl` e `tar` no Linux/macOS
- Compilador C/C++ para plugins que possuem etapas de build
- `tree-sitter-cli` 0.26.1+ quando necessário pelo Treesitter
- Nerd Font para os ícones
- `ripgrep` e `fd` para Telescope
- Runtimes dos LSPs que você realmente usar

## Perfis de LSP e Treesitter

Para manter a instalação inicial enxuta, o padrão usa um perfil **core**.

Defina as variáveis em `lua/config/options.lua`, antes do carregamento dos plugins, para usar o perfil completo:

```lua
vim.g.nvim_fusion_lsp_profile = "full"
vim.g.nvim_fusion_treesitter_profile = "full"
```

## Reprodutibilidade

O bootstrap do `lazy.nvim` usa um commit imutável, evitando depender do estado mutável da branch `stable` no primeiro clone. Para congelar também os plugins, execute `:Lazy sync` em uma instalação limpa e **versione o `lazy-lock.json` gerado**.

O arquivo de lock deve ser atualizado intencionalmente quando você decidir atualizar plugins; não remova o lockfile de uma instalação de produção/desenvolvimento reproduzível.

## Performance

O benchmark foi mantido como módulo opcional e usa APIs públicas do Neovim e do `lazy.nvim`. Para habilitá-lo manualmente, execute:

```vim
:lua require("config.benchmark").setup()
```

Depois disso, os comandos disponíveis são:

- `:BenchmarkAll`
- `:BenchmarkStats`
- `:BenchmarkSimple`
- `:BenchmarkStartup`
- `:BenchmarkToggleStartup`

O `updatetime` padrão é 200ms para reduzir disparos excessivos de `CursorHold`.

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
│       ├── core/
│       ├── editor/
│       ├── git/
│       └── ui/
└── README.md
```

## Verificação

Após instalar, execute:

```bash
nvim --version
```

Dentro do Neovim:

```vim
:checkhealth
:Lazy
:Mason
```

A branch também possui um smoke test headless em `.github/workflows/neovim-config.yml` para validar o carregamento com Neovim 0.12.2.
