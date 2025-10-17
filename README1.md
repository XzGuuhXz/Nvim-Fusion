# 🚀 Nvim Fusion - Configuração Moderna do Neovim

Uma configuração moderna, modular e completa do Neovim focada em produtividade máxima, com LSP, autocompletion, syntax highlighting avançado e muito mais.

![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)
![Version](https://img.shields.io/badge/version-2.0.0-brightgreen.svg?style=for-the-badge)

## 📋 Índice

- [✨ Destaques](#-destaques)
- [🔥 Principais Destaques](#-Principais-Destaques)
- [🚀 Instalação Rápida](#-instalação-rápida)
- [📁 Estrutura Detalhada](#-estrutura-detalhada)
- [🎯 Recursos Principais](#-recursos-principais)
- [⌨️ Guia de Keymaps](#️-guia-de-keymaps)
- [🔌 Plugins Organizados](#-plugins-organizados)
- [⚙️ Customização Avançada](#️-customização-avançada)
- [🛠️ Solução de Problemas](#️-solução-de-problemas)
- [🆘 Suporte](#-suporte)

## ✨ Destaques

### 🌟 **O que torna esta configuração especial?**

Esta configuração representa a **evolução completa** do Neovim, transitando de um setup básico (v1.0) para uma **IDE moderna e profissional** (v2.0). Com arquitetura modular, performance otimizada e interface rica, oferece uma experiência de desenvolvimento superior.

### 🚀 Transformação Completa

A versão 2.0 é uma **reescrita total** que transforma o Neovim em uma IDE moderna:

- **🏗️ Arquitetura Modular**: Sistema organizado e escalável
- **⚡ Performance 3x Superior**: Startup em ~90ms (vs 250ms da v1.0)
- **🎨 Interface Profissional**: UI rica com ícones e temas consistentes
- **🧠 LSP Completo**: 11+ linguagens com auto-instalação
- **📊 Monitoramento Avançado**: Sistema de benchmark integrado
- **🔧 Extensibilidade Total**: Plug-and-play para customizações

---

## 🔥 Principais Destaques

<table>
<tr>
<td width="33%">

### ⚡ **Performance**
- **64% mais rápido** startup
- **52% menos** uso de memória
- **Lazy loading** inteligente
- **Carregamento sob demanda**

</td>
<td width="33%">

### 🎨 **Interface**
- **Dashboard** personalizado
- **Statusline** rica e informativa
- **Buffer tabs** visuais
- **Ícones** em toda UI

</td>
<td width="34%">

### 🛠️ **Ferramentas**
- **LSP** para 11+ linguagens
- **Autocompletion** inteligente
- **Git** integração completa
- **Diagnósticos** avançados

</td>
</tr>
</table>

---

## 📊 Comparação Detalhada

### 🏗️ **Arquitetura: Monolítica → Modular**

<table>
<thead>
<tr>
<th width="15%"><strong>Aspecto</strong></th>
<th width="40%"><strong>Versão 1.0 (Básica)</strong></th>
<th width="45%"><strong>Versão 2.0 (Modular)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>🏗️ Estrutura</strong></td>
<td>
• Arquivos dispersos<br/>
• Configuração monolítica<br/>
• Difícil manutenção<br/>
• Acoplamento alto
</td>
<td>
• <strong>Sistema modular organizado</strong><br/>
• Separação por categorias<br/>
• Fácil manutenção e extensão<br/>
• Baixo acoplamento
</td>
</tr>
<tr>
<td><strong>📦 Plugins</strong></td>
<td>
• ~8 plugins básicos<br/>
• Funcionalidade limitada<br/>
• Configuração simples<br/>
• Packer.nvim
</td>
<td>
• <strong>25+ plugins especializados</strong><br/>
• Funcionalidade completa<br/>
• Configuração avançada<br/>
• Lazy.nvim moderno
</td>
</tr>
<tr>
<td><strong>⚡ Performance</strong></td>
<td>
• ~250ms startup<br/>
• Sem lazy loading<br/>
• Todos plugins carregados<br/>
• ~25MB memória
</td>
<td>
• <strong>~90ms startup (-64%)</strong><br/>
• Lazy loading inteligente<br/>
• Carregamento sob demanda<br/>
• ~12MB memória (-52%)
</td>
</tr>
<tr>
<td><strong>🎨 Interface</strong></td>
<td>
• Interface padrão<br/>
• Poucos ícones<br/>
• Tema básico<br/>
• Statusline simples
</td>
<td>
• <strong>Interface moderna profissional</strong><br/>
• Ícones consistentes<br/>
• TokyoNight + customizações<br/>
• Dashboard + Statusline rica
</td>
</tr>
<tr>
<td><strong>🛠️ LSP</strong></td>
<td>
• 3-4 linguagens<br/>
• Configuração manual<br/>
• LSP básico<br/>
• Completion simples
</td>
<td>
• <strong>11+ linguagens</strong><br/>
• Auto-instalação com Mason<br/>
• LSP completo e inteligente<br/>
• nvim-cmp + snippets avançados
</td>
</tr>
<tr>
<td><strong>📊 Monitoramento</strong></td>
<td>
• Sem sistema<br/>
• Debug manual<br/>
• Sem métricas<br/>
• Sem análise
</td>
<td>
• <strong>Sistema de benchmark completo</strong><br/>
• 5 comandos de análise<br/>
• Métricas detalhadas<br/>
• Relatórios exportáveis
</td>
</tr>
<tr>
<td><strong>🔧 Personalização</strong></td>
<td>
• Difícil de modificar<br/>
• Código acoplado<br/>
• Mudanças complexas<br/>
• Documentação básica
</td>
<td>
• <strong>Extremamente flexível</strong><br/>
• Módulos independentes<br/>
• Plug-and-play<br/>
• Documentação completa
</td>
</tr>
</tbody>
</table>

### 📈 **Métricas de Performance**

| Métrica | V1.0 | V2.0 | Melhoria |
|---------|------|------|----------|
| **🚀 Startup Time** | 250ms | 90ms | **64% mais rápido** |
| **🧠 Memory Usage** | 25MB | 12MB | **52% menos memória** |
| **🔌 Plugin Load** | 8/8 (100%) | 18/25 (72%) | **Lazy loading ativo** |
| **⏱️ First Paint** | 300ms | 120ms | **60% mais rápido** |
| **📦 Bundle Size** | ~50 arquivos | ~100 arquivos | **Organização modular** |

---

## 📊 Especificações Técnicas

| **Componente** | **Versão** | **Status** |
|----------------|------------|------------|
| **Nvim Fusion** | `v2.0.0` | ✅ Estável |
| **Neovim** | `>= 0.9.0` | ✅ Requerido |
| **Lua** | `5.1+` | ✅ Integrado |
| **Lazy.nvim** | `Latest` | 🔄 Auto-update |
| **LSP Servers** | `15+ linguagens` | 🔧 Gerenciado pelo Mason |
| **Plugins** | `25+ otimizados` | 📦 Lazy loading |

## 🚀 Instalação Rápida

### ⚡ **Instalação em 1 Comando**

```bash
# Backup + Instalação + Configuração automática
curl -fsSL https://raw.githubusercontent.com/XzGuuhXz/Nvim-Fusion/main/install.sh | bash
```

### 📋 **Instalação Manual Detalhada**

#### **1. Pré-requisitos**

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install neovim git curl unzip

# Arch Linux  
sudo pacman -S neovim git curl unzip

# macOS
brew install neovim git curl

# Windows (Chocolatey)
choco install neovim git curl
```

#### **2. Instalar Nerd Font**

```bash
# Linux/macOS - FiraCode Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
unzip FiraCode.zip && rm FiraCode.zip
fc-cache -fv

# Windows - Manual
# Baixar de: https://github.com/ryanoasis/nerd-fonts/releases
# Instalar: FiraCode Nerd Font
```

#### **3. Instalar Configuração**

```bash
# Backup da configuração atual (se existir)
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)

# Clonar Nvim Fusion
git clone https://github.com/XzGuuhXz/Nvim-Fusion.git ~/.config/nvim

# Iniciar Neovim (plugins serão instalados automaticamente)
nvim
```

#### **4. Verificação Pós-Instalação**

```vim
" No Neovim, executar:
:checkhealth          " Verificar saúde geral
:Lazy                 " Ver status dos plugins
:Mason                " Ver LSP servers instalados
:LspInfo              " Ver LSP ativo no buffer
```

## 📁 Estrutura Detalhada

```
~/.config/nvim/
├── init.lua                          # 🚪 Ponto de entrada
├── lua/
│   ├── config/                       # ⚙️ Configurações core
│   │   ├── init.lua                  #   └─ Carregador principal
│   │   ├── options.lua               #   └─ Opções do Neovim
│   │   ├── keymaps.lua               #   └─ Keymaps fundamentais
│   │   ├── autocmds.lua              #   └─ Auto comandos
│   │   ├── lazy.lua                  #   └─ Configuração Lazy.nvim
│   │   └── benchmark.lua             #   └─ Sistema de performance
│   └── plugins/                      # 🔌 Plugins organizados
│       ├── init.lua                  #   └─ Índice de plugins
│       ├── core/                     #   🧠 Funcionalidade essencial
│       │   ├── lsp.lua               #   └─ Language Server Protocol
│       │   ├── treesitter.lua        #   └─ Syntax highlighting
│       │   ├── autopairs.lua         #   └─ Auto parênteses
│       │   ├── lspkind.lua           #   └─ Ícones LSP
│       │   └── trouble.lua           #   └─ Diagnósticos
│       ├── completion/               #   📝 Sistema de completion
│       │   └── nvim-cmp.lua          #   └─ Autocompletion engine
│       ├── editor/                   #   ✏️ Ferramentas de edição
│       │   ├── telescope.lua         #   └─ Fuzzy finder
│       │   ├── nvim-tree.lua         #   └─ Explorador clássico
│       │   ├── neo-tree.lua          #   └─ Explorador moderno
│       │   └── which-key.lua         #   └─ Guia de comandos
│       ├── ui/                       #   🎨 Interface visual
│       │   ├── tokyonight.lua        #   └─ Tema principal
│       │   ├── lualine.lua           #   └─ Barra de status
│       │   ├── bufferline.lua        #   └─ Abas de buffers
│       │   ├── alpha.lua             #   └─ Dashboard
│       │   ├── indent-blankline.lua  #   └─ Guias de indentação
│       │   └── colorizer.lua         #   └─ Preview de cores
│       └── git/                      #   📚 Integração Git
│           └── gitsigns.lua          #   └─ Sinais Git na margem
└── README.md                         # 📖 Esta documentação
```

## 🎯 Recursos Principais

### 🔍 **Sistema de Busca (Telescope)**

**Funcionalidades:**
- Busca ultrarrápida de arquivos com preview instantâneo
- Live grep em todo projeto com regex support
- Busca em histórico de comandos e documentação
- Integração nativa com Git
- Interface totalmente customizável

**Configurações Avançadas:**
```lua
-- Em lua/plugins/editor/telescope.lua
defaults = {
  prompt_prefix = " 󰍉 ",
  selection_caret = " 󰅂 ",
  layout_config = {
    horizontal = { preview_width = 0.55 },
    vertical = { mirror = false },
  },
}
```

### 🧠 **Language Server Protocol (LSP)**

**Servidores Incluídos:**
- **Lua**: `lua_ls` (configurado para Neovim)
- **Python**: `pyright` (type checking avançado)
- **JS/TS**: `ts_ls` (inlay hints incluídos)
- **Web**: `html`, `cssls`, `jsonls`
- **Sistema**: `bashls`, `yamlls`
- **Compilados**: `clangd`, `rust_analyzer`, `jdtls`
- **E mais**: Automático via Mason

**Recursos LSP:**
- ✅ Go-to definition/declaration/implementation
- ✅ Find references com preview
- ✅ Hover documentation com syntax highlighting
- ✅ Code actions contextuais
- ✅ Rename de símbolos em massa
- ✅ Diagnósticos em tempo real
- ✅ Formatação automática de código
- ✅ Inlay hints para TypeScript/JavaScript

### 🌳 **Exploradores de Arquivos**

**NvimTree (Clássico):**
- Interface estável e confiável
- Integração completa com Git status
- Ícones coloridos por tipo de arquivo
- Navegação rápida com teclas Vim

**NeoTree (Moderno):**
- Interface redesenhada e moderna
- Múltiplas fontes (filesystem, buffers, git, símbolos)
- Preview de arquivos integrado
- Ações contextuais avançadas

### 📝 **Sistema de Autocompletion**

**Engine Principal:**
- **nvim-cmp**: Engine mais robusta disponível
- **15+ fontes**: LSP, snippets, buffer, path, cmdline
- **Performance otimizada**: Debounce e throttling inteligente
- **Ghost text**: Preview do que será inserido

**Snippets Avançados:**
- **LuaSnip**: Engine moderna com suporte a transformações
- **friendly-snippets**: 1000+ snippets prontos
- **Snippets customizados**: Para workflows específicos
- **Navegação inteligente**: Tab/Shift+Tab entre placeholders

## ⌨️ Guia de Keymaps

### **Leader Key**: `<Space>` (Espaço)

### 🔍 **Find & Search**
| Keymap | Comando | Descrição |
|--------|---------|-----------|
| `<leader>ff` | Telescope find_files | 🔍 Buscar arquivos |
| `<leader>fg` | Telescope live_grep | 🔍 Buscar texto (projeto) |
| `<leader>fb` | Telescope buffers | 📂 Listar buffers abertos |
| `<leader>fh` | Telescope help_tags | ❓ Buscar ajuda Neovim |
| `<leader>fs` | :w | 💾 Salvar arquivo |

### 📁 **File Explorers**
| Keymap | Comando | Descrição |
|--------|---------|-----------|
| `<leader>e` | NvimTreeToggle | 🌳 Toggle NvimTree |
| `<leader>o` | NvimTreeFocus | 🎯 Focar NvimTree |
| `<leader>nf` | NvimTreeFindFile | 📍 Encontrar arquivo atual |
| `<leader>ft` | Neotree toggle | 🌲 Toggle NeoTree |

### 💻 **LSP (Language Server)**
| Keymap | Comando | Descrição |
|--------|---------|-----------|
| `gd` | goto_definition | 📍 Ir para definição |
| `gD` | goto_declaration | 📍 Ir para declaração |
| `gr` | show_references | 🔗 Ver referências |
| `gi` | goto_implementation | 🔗 Ver implementação |
| `gt` | goto_type_definition | 🏷️ Definição do tipo |
| `K` | hover | 📖 Documentação hover |
| `<C-k>` | signature_help | ✍️ Ajuda de assinatura |
| `<leader>ca` | code_action | ⚡ Ações de código |
| `<leader>rn` | rename | ✏️ Renomear símbolo |
| `<leader>f` | format | 🎨 Formatar código |
| `[d` / `]d` | goto_prev/next_diagnostic | ⬅️➡️ Navegar diagnósticos |
| `<leader>e` | open_float | 🔍 Mostrar diagnóstico |

### 🔧 **Trouble (Diagnósticos)**
| Keymap | Comando | Descrição |
|--------|---------|-----------|
| `<leader>xx` | Trouble diagnostics | 📋 Todos diagnósticos |
| `<leader>xX` | Trouble buffer diagnostics | 📋 Diagnósticos do buffer |
| `<leader>cs` | Trouble symbols | 📋 Lista de símbolos |
| `<leader>cl` | Trouble LSP | 📋 Definições/referências LSP |

### 📝 **Edição & Navegação**
| Keymap | Comando | Descrição |
|--------|---------|-----------|
| `<Tab>` / `<S-Tab>` | BufferLineCycleNext/Prev | 🔄 Navegar buffers |
| `<leader>x` | bdelete | ❌ Fechar buffer |
| `<leader>q` | quit | 🚪 Sair do Neovim |
| `<C-h/j/k/l>` | move_window | 🧭 Navegar janelas |
| `n` / `N` | next/prev_search + zz | 🔍 Busca centralizada |

### 🎨 **Git Integration**
| Keymap | Comando | Descrição |
|--------|---------|-----------|
| `<leader>hs` | stage_hunk | ➕ Stage git hunk |
| `<leader>hr` | reset_hunk | ↩️ Reset git hunk |
| `<leader>hp` | preview_hunk | 👁️ Preview mudanças |
| `<leader>hb` | blame_line | 👤 Git blame linha |
| `<leader>hS` | stage_buffer | ➕ Stage buffer inteiro |
| `<leader>hR` | reset_buffer | ↩️ Reset buffer inteiro |
| `]c` / `[c` | next/prev_hunk | ⬅️➡️ Navegar hunks |

### 📝 **Modo Visual**
| Keymap | Comando | Descrição |
|--------|---------|-----------|
| `J` / `K` | move_line_down/up | ⬆️⬇️ Mover linhas selecionadas |
| `<` / `>` | indent_left/right | ↔️ Indentar seleção |
| `<leader>ca` | code_action (visual) | ⚡ Ações de código (visual) |

### 🚀 **Autocompletion**
| Keymap | Comando | Descrição |
|--------|---------|-----------|
| `<Tab>` | select_next_item | ⬇️ Próximo item |
| `<S-Tab>` | select_prev_item | ⬆️ Item anterior |
| `<C-Space>` | complete | 🔍 Mostrar completion |
| `<CR>` | confirm | ✅ Aceitar seleção |
| `<C-e>` | abort | ❌ Cancelar completion |
| `<C-b/f>` | scroll_docs | 📜 Scroll documentação |

## 🔌 Plugins Organizados

### **🧠 Core Functionality**

#### **nvim-lspconfig + mason.nvim**
```lua
-- Configuração automática de LSP servers
ensure_installed = {
  "lua_ls", "pyright", "ts_ls", "html", "cssls", 
  "jsonls", "yamlls", "bashls", "clangd", "rust_analyzer"
}
```

#### **nvim-treesitter**
```lua
-- Syntax highlighting avançado para 15+ linguagens
ensure_installed = {
  "lua", "python", "javascript", "typescript", "html", 
  "css", "json", "yaml", "markdown", "bash", "c", "cpp"
}
```

### **📝 Completion & Snippets**

#### **nvim-cmp (Engine Principal)**
```lua
-- Fontes configuradas por prioridade
sources = {
  { name = "nvim_lsp", priority = 1000 },    -- LSP
  { name = "luasnip", priority = 750 },      -- Snippets
  { name = "buffer", priority = 500 },       -- Buffer
  { name = "path", priority = 250 },         -- Caminhos
}
```

#### **LuaSnip + friendly-snippets**
- 1000+ snippets prontos para uso
- Suporte a transformações avançadas
- Navegação inteligente entre placeholders

### **✏️ Editor Enhancements**

#### **Telescope.nvim**
```lua
-- Fuzzy finder configurado
defaults = {
  sorting_strategy = "ascending",
  layout_config = {
    prompt_position = "top",
    preview_width = 0.55,
  },
}
```

#### **NvimTree + NeoTree**
- Dois exploradores de arquivo incluídos
- NvimTree: Clássico e estável
- NeoTree: Moderno com múltiplas fontes

### **🎨 UI & Themes**

#### **Tokyo Night**
```lua
-- 4 variações disponíveis
styles = { "storm", "moon", "night", "day" }
-- Customizações para Nvim Fusion
sidebars = { "qf", "help", "neo-tree" }
```

#### **Lualine (Status Line)**
- Informações ricas: modo, git, diagnósticos, LSP
- Ícones customizados para cada seção
- Cores sincronizadas com tema

#### **Bufferline (Tabs)**
- Abas elegantes com ícones
- Integração com diagnósticos LSP
- Indicadores de modificação

### **📚 Git Integration**

#### **Gitsigns**
```lua
-- Sinais na margem + comandos Git
signs = {
  add = { text = '│' },
  change = { text = '│' },
  delete = { text = '_' },
}
```

## ⚙️ Customização Avançada

### 🎨 **Alterar Tema**

```lua
-- Em lua/plugins/ui/tokyonight.lua
require("tokyonight").setup({
  style = "night",        -- "storm", "moon", "night", "day"
  transparent = true,     -- Fundo transparente
  terminal_colors = true, -- Cores no terminal integrado
  styles = {
    comments = { italic = true },
    keywords = { italic = true, bold = true },
    functions = { bold = true },
  },
})
vim.cmd.colorscheme("tokyonight-night")
```

### ⌨️ **Adicionar Keymaps Personalizados**

```lua
-- Em lua/config/keymaps.lua
vim.keymap.set("n", "<leader>mt", function()
  print("Meu comando personalizado!")
end, { desc = "Meu comando" })

-- Com which-key para grupos organizados
-- Em lua/plugins/editor/which-key.lua
wk.add({
  { "<leader>m", group = "󰈸 Meus Comandos" },
  { "<leader>mt", "<cmd>echo 'Teste'<CR>", desc = "Comando teste" },
  { "<leader>mc", "<cmd>lua MeuScript()<CR>", desc = "Meu script" },
})
```

### 🔌 **Adicionar Plugin Novo**

```lua
-- Criar: lua/plugins/categoria/meu-plugin.lua
return {
  "autor/meu-plugin.nvim",
  lazy = true,                    -- Lazy loading
  event = "BufRead",             -- Ou: cmd, keys, ft
  dependencies = { 
    "nvim-lua/plenary.nvim" 
  },
  config = function()
    require("meu-plugin").setup({
      opcao1 = true,
      opcao2 = "valor",
    })
  end,
  keys = {
    { "<leader>mp", "<cmd>MeuPlugin<cr>", desc = "Abrir Plugin" }
  }
}

-- Adicionar em lua/plugins/init.lua
return {
  -- ... outros plugins
  require("plugins.categoria.meu-plugin"),
}
```

### 🛠️ **Configurar Novo LSP Server**

```lua
-- Em lua/plugins/core/lsp.lua na seção handlers:
meu_server = function()
  vim.lsp.config("meu_server", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      meuServer = {
        configuracao1 = true,
        configuracao2 = "valor",
      },
    },
    root_dir = function(fname)
      return require("lspconfig.util").find_git_ancestor(fname)
    end,
  })
end,

-- E na lista ensure_installed:
ensure_installed = {
  -- ... outros servers
  "meu_server",
},
```

### 📝 **Personalizar Autocompletion**

```lua
-- Em lua/plugins/completion/nvim-cmp.lua
-- Adicionar nova fonte
sources = cmp.config.sources({
  { name = "nvim_lsp", priority = 1000 },
  { name = "minha_fonte", priority = 800 },  -- Nova fonte
  { name = "luasnip", priority = 750 },
}, {
  { name = "buffer", priority = 500, keyword_length = 3 },
})

-- Customizar formatação
formatting = {
  format = lspkind.cmp_format({
    before = function(entry, vim_item)
      -- Ícones personalizados por fonte
      local source_icons = {
        nvim_lsp = "🔧",
        minha_fonte = "🎯",
        buffer = "📄",
      }
      vim_item.menu = source_icons[entry.source.name] or "❓"
      return vim_item
    end,
  }),
},
```

### 🎯 **Configurar Snippets Personalizados**

```lua
-- Criar: ~/.config/nvim/snippets/lua.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("hello", {
    t("print('Hello "),
    i(1, "World"),
    t("!')")
  }),
  
  s("func", {
    t("function "),
    i(1, "nome"),
    t("("),
    i(2, "args"),
    t({")","  "}),
    i(3, "-- corpo"),
    t({"","end"})
  }),
}

-- Carregar em lua/plugins/completion/nvim-cmp.lua
require("luasnip.loaders.from_lua").load({
  paths = "~/.config/nvim/snippets"
})
```

## 🛠️ Solução de Problemas

### ❌ **Problemas Comuns**

#### **1. Ícones não aparecem**
```bash
# Verificar se Nerd Font está instalada
fc-list | grep -i fira

# No terminal, configurar font family
# GNOME Terminal:
gsettings set org.gnome.desktop.interface monospace-font-name 'FiraCode Nerd Font 12'

# Windows Terminal (settings.json):
{
  "profiles": {
    "defaults": {
      "font": { "face": "FiraCode Nerd Font" }
    }
  }
}
```

#### **2. LSP não funciona**
```vim
:checkhealth lsp    " Verificar saúde LSP
:LspInfo           " Ver servers ativos
:Mason             " Gerenciar servers

" Se server não está instalado:
:MasonInstall lua_ls pyright ts_ls
```

#### **3. Plugins não carregam**
```vim
:Lazy sync         " Sincronizar plugins
:Lazy clean        " Remover plugins não utilizados
:Lazy health       " Verificar saúde do Lazy

" Em caso extremo:
rm -rf ~/.local/share/nvim
nvim               " Reinstala tudo
```

#### **4. Performance lenta**
```vim
:Lazy profile      " Ver tempos de carregamento
:BenchmarkAll     " Relatório completo (comando personalizado)

" Otimizações:
" - Verificar plugins desnecessários
" - Reduzir ensure_installed no Mason
" - Usar lazy loading mais agressivo
```

#### **5. Configurações não aplicam**
```bash
# Verificar sintaxe Lua
cd ~/.config/nvim
lua -c "dofile('init.lua')"

# Verificar logs de erro
nvim --headless -c 'quit' 2>&1 | grep ERROR

# Resetar cache
rm -rf ~/.local/share/nvim/{lazy,mason}
```

### 🔧 **Comandos de Diagnóstico**

```vim
" === COMANDOS ESSENCIAIS ===
:checkhealth          " Verificação completa do sistema
:checkhealth lsp      " Específico para LSP
:checkhealth lazy     " Específico para Lazy.nvim

" === STATUS DOS PLUGINS ===
:Lazy                 " Interface do Lazy.nvim
:Lazy sync           " Atualizar todos plugins
:Lazy clean          " Limpar plugins não utilizados
:Lazy profile        " Ver performance dos plugins

" === LSP MANAGEMENT ===
:Mason               " Interface do Mason
:LspInfo             " Informações LSP do buffer
:LspRestart          " Reiniciar LSP servers

" === COMANDOS PERSONALIZADOS ===
:BenchmarkAll        " Relatório completo da configuração
:BenchmarkStats      " Estatísticas de performance
:BenchmarkStartup    " Tempo de inicialização
```

### 🐛 **Debug Avançado**

```lua
-- Ativar logs detalhados (temporariamente)
-- Em lua/config/options.lua
vim.lsp.set_log_level("debug")

-- Ver logs LSP
-- :lua print(vim.fn.stdpath("cache") .. "/lsp.log")

-- Debug de keymaps
-- :verbose map <leader>ff

-- Debug de autocommands
-- :autocmd
```

## 🆘 Suporte

### 📚 **Recursos de Aprendizado**

- [**Documentação Oficial Neovim**](https://neovim.io/doc/)
- [**Guia Lua para Neovim**](https://github.com/nanotee/nvim-lua-guide)
- [**Learn Vimscript the Hard Way**](https://learnvimscriptthehardway.stevelosh.com/)
- [**Lazy.nvim Documentation**](https://lazy.folke.io/)
- [**Mason.nvim Registry**](https://mason-registry.dev/)

### 💬 **Onde Buscar Ajuda**

1. **GitHub Issues** - Para bugs específicos desta configuração
2. **r/neovim** - Comunidade ativa para dúvidas gerais
3. **Neovim Discord** - Ajuda em tempo real
4. **Stack Overflow** - Problemas técnicos de programação
5. **YouTube** - Tutoriais visuais de Neovim

### 🔍 **Verificação de Integridade**

```bash
# Script de verificação rápida
curl -fsSL https://raw.githubusercontent.com/XzGuuhXz/Nvim-Fusion/main/health-check.sh | bash
```

### 📞 **Reportar Problemas**

Ao reportar um problema, inclua:

```bash
# Informações do sistema
nvim --version
uname -a

# Logs relevantes  
nvim --headless -c 'checkhealth' -c 'quit' > health.log 2>&1

# Configurações ativas
cat ~/.config/nvim/lua/config/options.lua
```

## 🤝 Contribuindo

### 🚀 **Como Contribuir**

1. **Fork** o repositório
2. **Crie** uma branch: `git checkout -b feature/minha-feature`
3. **Faça** suas alterações seguindo o padrão do projeto
4. **Teste** extensivamente em diferentes cenários
5. **Commit** com mensagens descritivas: `git commit -m "feat: adicionar suporte X"`
6. **Push** para sua branch: `git push origin feature/minha-feature`  
7. **Abra** um Pull Request detalhado

### 📝 **Padrões do Projeto**

```lua
-- Estilo de código Lua
local function configurar_plugin()
  return {
    "autor/plugin.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require("plugin").setup({
        opcao = "valor",
      })
    end,
    keys = {
      { "<leader>x", "<cmd>Comando<cr>", desc = "Descrição" }
    }
  }
end
```

### 🏆 **Tipos de Contribuições Bem-vindas**

- 🐛 **Correção de bugs**
- ✨ **Novas funcionalidades**
- 📚 **Melhorias na documentação**
- 🎨 **Otimizações de performance**
- 🌍 **Traduções**
- 🔧 **Novos plugins úteis**

## 🎉 Agradec
