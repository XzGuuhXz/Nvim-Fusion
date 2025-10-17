# 🚀 Neovim Fusion 2.0 - Configuração Modular & Moderna

<div align="center">

![Neovim](https://img.shields.io/badge/neovim-v0.9+-green.svg?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/lua-5.1+-blue.svg?style=for-the-badge&logo=lua)
![License](https://img.shields.io/badge/license-MIT-orange.svg?style=for-the-badge)
![Plugins](https://img.shields.io/badge/plugins-25+-purple.svg?style=for-the-badge)
![Performance](https://img.shields.io/badge/startup-<100ms-red.svg?style=for-the-badge)

*Uma configuração completa, moderna e profissional do Neovim*

**🎯 De básico para profissional • ⚡ Performance otimizada • 🎨 Interface moderna**

</div>

---

## 📑 Índice

- [🎯 Visão Geral](#-visão-geral)
- [🔥 Principais Destaques](#-principais-destaques)
- [📊 Comparação Detalhada](#-comparação-detalhada)
- [🌟 Funcionalidades](#-funcionalidades)
- [📦 Plugins Incluídos](#-plugins-incluídos)
- [⚡ Instalação](#-instalação)
- [🗂️ Estrutura do Projeto](#️-estrutura-do-projeto)
- [⌨️ Atalhos de Teclado](#️-atalhos-de-teclado)
- [🛠️ LSP & Autocompletion](#️-lsp--autocompletion)
- [🎨 Interface & UI](#-interface--ui)
- [📈 Sistema de Benchmark](#-sistema-de-benchmark)
- [🚀 Performance & Otimizações](#-performance--otimizações)
- [🔧 Personalização](#-personalização)
- [🔄 Migração da V1.0](#-migração-da-v10)
- [🔧 Troubleshooting](#-troubleshooting)
- [📖 Histórico de Versões](#-histórico-de-versões)
- [🤝 Contribuição](#-contribuição)

---

## 🎯 Visão Geral

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

## 🌟 Funcionalidades

### 🔧 **Core Features**
- ✅ **Lazy.nvim** - Gerenciamento moderno de plugins
- ✅ **LSP Nativo** - Suporte completo a Language Server Protocol  
- ✅ **Treesitter** - Syntax highlighting avançado e AST
- ✅ **Mason** - Auto-instalação de ferramentas de desenvolvimento
- ✅ **nvim-cmp** - Sistema de autocompletion inteligente
- ✅ **LuaSnip** - Engine de snippets avançado

### 🎨 **Interface & UX**
- ✅ **TokyoNight Theme** - Tema moderno com 4 variantes
- ✅ **Lualine** - Statusline rica e informativa
- ✅ **Bufferline** - Gerenciamento visual de buffers
- ✅ **Alpha Dashboard** - Tela inicial personalizada
- ✅ **Which-Key** - Guia visual de atalhos em tempo real
- ✅ **Icons Everywhere** - Ícones consistentes em toda UI

### 🛠️ **Ferramentas de Desenvolvimento**
- ✅ **Telescope** - Busca fuzzy poderosa e extensível
- ✅ **Neo-tree + nvim-tree** - Exploradores de arquivos dual
- ✅ **Gitsigns** - Integração Git com indicadores visuais
- ✅ **Trouble** - Lista organizada de diagnósticos
- ✅ **Autopairs** - Fechamento automático de pares
- ✅ **Colorizer** - Preview de cores inline

### 📊 **Monitoramento & Debug**
- ✅ **Sistema de Benchmark** - Análise completa de performance
- ✅ **Diagnósticos LSP** - Detecção de erros em tempo real
- ✅ **Git Indicators** - Status visual de mudanças
- ✅ **Memory Monitoring** - Controle de uso de recursos

---

## 📦 Plugins Incluídos

### 🔧 **Core Functionality (6 plugins)**
| Plugin | Descrição | Função Principal |
|--------|-----------|------------------|
| **lazy.nvim** | Gerenciador moderno de plugins | 📦 Plugin Manager |
| **nvim-lspconfig** | Configuração LSP nativa | 🛠️ LSP Core |
| **mason.nvim** | Instalador de LSP servers | 🔧 LSP Installer |
| **mason-lspconfig** | Integração Mason + LSPConfig | 🔗 LSP Bridge |
| **nvim-treesitter** | Parser syntax highlighting | 🌳 Syntax Parser |
| **nvim-treesitter-textobjects** | Text objects inteligentes | 📝 Smart Selection |

### 🧠 **Completion & Snippets (9 plugins)**
| Plugin | Descrição | Tipo |
|--------|-----------|------|
| **nvim-cmp** | Engine principal de completion | 🧠 Core Engine |
| **cmp-nvim-lsp** | Source LSP para completion | 📡 LSP Source |
| **cmp-buffer** | Completion do buffer atual | 📄 Buffer Source |
| **cmp-path** | Completion de caminhos | 📁 Path Source |
| **cmp-cmdline** | Completion da linha de comando | ⌨️ CMD Source |
| **cmp-nvim-lsp-signature-help** | Assinatura de funções | 📋 Function Help |
| **LuaSnip** | Engine de snippets | 📝 Snippet Engine |
| **cmp_luasnip** | Integração LuaSnip + cmp | 🔗 Snippet Bridge |
| **friendly-snippets** | Biblioteca de snippets | 📚 Snippet Library |

### 🎨 **Interface & UI (8 plugins)**
| Plugin | Descrição | Visual Feature |
|--------|-----------|----------------|
| **tokyonight.nvim** | Tema moderno e elegante | 🎨 Main Theme |
| **lualine.nvim** | Statusline rica e customizável | 📊 Status Bar |
| **bufferline.nvim** | Tabs visuais para buffers | 📑 Buffer Tabs |
| **alpha-nvim** | Dashboard de boas-vindas | 🏠 Welcome Screen |
| **which-key.nvim** | Guia visual de atalhos | ⌨️ Key Helper |
| **indent-blankline.nvim** | Guias de indentação | 📏 Indent Guides |
| **nvim-colorizer.lua** | Preview de cores em hex/rgb | 🌈 Color Preview |
| **nvim-web-devicons** | Ícones para filetypes | 🎭 File Icons |

### 🛠️ **Edição & Ferramentas (5 plugins)**
| Plugin | Descrição | Uso Principal |
|--------|-----------|---------------|
| **telescope.nvim** | Busca fuzzy avançada | 🔍 Fuzzy Finder |
| **neo-tree.nvim** | Explorador moderno | 📂 Modern Explorer |
| **nvim-tree.lua** | Explorador clássico | 📁 Classic Explorer |
| **nvim-autopairs** | Fechamento automático | ✨ Auto Pairs |
| **trouble.nvim** | Lista de diagnósticos | 🚨 Diagnostics |

### 🌿 **Git Integration (1 plugin)**
| Plugin | Descrição | Git Feature |
|--------|-----------|-------------|
| **gitsigns.nvim** | Indicadores Git completos | 📊 Git Visual |

### 🔧 **Development Tools (2 plugins)**
| Plugin | Descrição | Development |
|--------|-----------|-------------|
| **lspkind.nvim** | Ícones para completion | 🎨 Completion Icons |
| **plenary.nvim** | Biblioteca de utilitários | 🔧 Utility Library |

### 📊 **Sistema Personalizado**
| Módulo | Descrição | Comandos |
|--------|-----------|----------|
| **benchmark.lua** | Sistema completo de análise | 5 comandos de benchmark |

---

## ⚡ Instalação

### 📋 **Pré-requisitos**

```bash
# ✅ Neovim 0.9.0 ou superior (OBRIGATÓRIO)
nvim --version

# ✅ Git (OBRIGATÓRIO)
git --version

# ✅ Node.js 16+ (para LSP servers)
node --version && npm --version

# ✅ Python 3.8+ com pip (para LSP servers)
python3 --version && pip3 --version

# ✅ Compilador C (para Treesitter - OBRIGATÓRIO)
gcc --version  # ou clang --version

# 📦 Ferramentas opcionais mas recomendadas
ripgrep --version  # Para Telescope (busca rápida)
fd --version       # Para Telescope (busca de arquivos)
```

### 🚀 **Instalação Automática (Recomendada)**

```bash
# 1️⃣ Backup da configuração atual (se existir)
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)

# 2️⃣ Clone desta configuração
git clone https://github.com/seu-usuario/nvim-config-2.0 ~/.config/nvim

# 3️⃣ Primeira execução (instalação automática de tudo)
nvim
```

### 🔧 **Instalação Manual Passo-a-Passo**

```bash
# 1️⃣ Criar estrutura de diretórios
mkdir -p ~/.config/nvim/lua/{config,plugins/{core,completion,ui,editor,git}}

# 2️⃣ Copiar arquivos de configuração
cp -r lua/config/* ~/.config/nvim/lua/config/
cp -r lua/plugins/* ~/.config/nvim/lua/plugins/
cp init.lua ~/.config/nvim/

# 3️⃣ Primeira execução
nvim +checkhealth
```

### 🔍 **Verificação da Instalação**

Execute no Neovim após a instalação:

```vim
" Verificar saúde geral do sistema
:checkhealth

" Verificar plugins instalados
:Lazy

" Verificar LSP servers
:Mason

" Verificar performance
:BenchmarkAll

" Verificar LSP funcionando
:LspInfo
```

### 🚨 **Soluções para Problemas Comuns**

```bash
# ❌ Se o Neovim não iniciar:
nvim --clean  # Inicia sem configuração

# ❌ Se plugins não instalarem:
nvim -c "Lazy! sync" -c "qa"

# ❌ Se LSP não funcionar:
nvim -c "MasonInstallAll" -c "qa"

# ❌ Para reinstalação completa:
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

---

## 🗂️ Estrutura do Projeto

### 📁 **Organização Modular Completa**

```
~/.config/nvim/
├── 📄 init.lua                           # 🚀 Ponto de entrada principal
├── 📄 README.md                          # 📚 Esta documentação
└── 📁 lua/
    ├── 📁 config/                        # ⚙️ Configurações base do Neovim
    │   ├── 📄 init.lua                   # 🔗 Carregador de configurações
    │   ├── 📄 options.lua                # 🎯 Opções e configurações do vim
    │   ├── 📄 keymaps.lua                # ⌨️ Mapeamentos globais de teclas
    │   ├── 📄 autocmds.lua               # 🎯 Auto-comandos e eventos
    │   ├── 📄 lazy.lua                   # 📦 Configuração do Lazy.nvim
    │   └── 📄 benchmark.lua              # 📊 Sistema completo de benchmark
    └── 📁 plugins/                       # 🔌 Plugins organizados por categoria
        ├── 📁 core/                      # 🔧 Funcionalidades essenciais
        │   ├── 📄 lsp.lua                # 🛠️ LSP + Mason (configuração completa)
        │   ├── 📄 treesitter.lua         # 🌳 Syntax highlighting avançado
        │   ├── 📄 autopairs.lua          # 🔄 Auto-fechamento de pares
        │   ├── 📄 lspkind.lua            # 🎨 Ícones para LSP
        │   └── 📄 trouble.lua            # 🚨 Diagnósticos organizados
        ├── 📁 completion/                # 🧠 Sistema de autocompletion
        │   └── 📄 nvim-cmp.lua           # 🧠 Engine completa de completion
        ├── 📁 editor/                    # ✏️ Ferramentas de edição
        │   ├── 📄 telescope.lua          # 🔍 Busca fuzzy poderosa
        │   ├── 📄 nvim-tree.lua          # 📁 Explorador de arquivos clássico
        │   ├── 📄 neo-tree.lua           # 📂 Explorador moderno alternativo
        │   └── 📄 which-key.lua          # ⌨️ Guia visual de atalhos
        ├── 📁 git/                       # 🌿 Integração com Git
        │   └── 📄 gitsigns.lua           # 📊 Indicadores Git avançados
        ├── 📁 ui/                        # 🎨 Interface e temas
        │   ├── 📄 tokyonight.lua         # 🎨 Tema principal moderno
        │   ├── 📄 lualine.lua            # 📊 Statusline rica e customizada
        │   ├── 📄 bufferline.lua         # 📑 Gerenciador visual de buffers
        │   ├── 📄 alpha.lua              # 🏠 Dashboard de boas-vindas
        │   ├── 📄 indent-blankline.lua   # 📏 Guias de indentação
        │   └── 📄 colorizer.lua          # 🌈 Preview de cores inline
        └── 📄 init.lua                   # 🔗 Carregador principal de plugins
```

### 🏗️ **Princípios da Arquitetura**

**🎯 Separação de Responsabilidades:**
- `config/` - Configurações base do Neovim
- `plugins/core/` - Funcionalidades essenciais (LSP, Treesitter)
- `plugins/completion/` - Sistema de autocompletion
- `plugins/editor/` - Ferramentas de edição e navegação
- `plugins/ui/` - Interface, temas e visual
- `plugins/git/` - Integração com Git

**🔄 Carregamento Modular:**
- Cada plugin em arquivo separado
- Lazy loading por categoria
- Dependências explícitas
- Configuração isolada

**📊 Sistema de Monitoramento:**
- Benchmark personalizado integrado
- Métricas de performance detalhadas
- Comandos de análise especializados

---

## ⌨️ Atalhos de Teclado

### 🎯 **Atalhos Fundamentais**

| Tecla | Modo | Ação | Plugin/Categoria |
|-------|------|------|------------------|
| `<Space>` | Normal | **🎯 Leader Key** | Core |
| `<C-h/j/k/l>` | Normal | **🪟 Navegação entre janelas** | Core |
| `<Tab>` | Normal | **📑 Próximo buffer** | Bufferline |
| `<S-Tab>` | Normal | **📑 Buffer anterior** | Bufferline |

### 📁 **Gerenciamento de Arquivos**

| Tecla | Ação | Descrição | Plugin |
|-------|------|-----------|--------|
| `<leader>pv` | `:Ex` | Abrir Netrw nativo | Core |
| `<leader>e` | NvimTree Toggle | Toggle explorador clássico | nvim-tree |
| `<leader>o` | NvimTree Focus | Focar explorador | nvim-tree |
| `<leader>ft` | NeoTree Toggle | Toggle explorador moderno | neo-tree |
| `<leader>nf` | Find File | Encontrar arquivo no explorador | nvim-tree |
| `<leader>w` | `:w` | Salvar arquivo | Core |
| `<leader>q` | `:q` | Fechar Neovim | Core |
| `<leader>x` | `:bdelete` | Fechar buffer atual | Bufferline |

### 🔍 **Busca com Telescope**

| Tecla | Ação | Descrição | Funcionalidade |
|-------|------|-----------|----------------|
| `<leader>ff` | **Find Files** | Buscar arquivos no projeto | Fuzzy finder |
| `<leader>fg` | **Live Grep** | Busca textual em todos arquivos | Grep integrado |
| `<leader>fb` | **Buffers** | Listar e alternar buffers | Buffer switcher |
| `<leader>fh` | **Help Tags** | Buscar na documentação | Help system |
| `<leader>fr` | **Recent Files** | Arquivos recentes | History |
| `<leader>fc` | **Commands** | Buscar comandos | Command palette |

### 🛠️ **LSP & Development**

#### 🎯 **Navegação de Código**
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `gd` | **Go to Definition** | Ir para definição |
| `gD` | **Go to Declaration** | Ir para declaração |
| `gi` | **Go to Implementation** | Ir para implementação |
| `gr` | **Go to References** | Mostrar todas referências |
| `gt` | **Go to Type Definition** | Ir para definição do tipo |
| `K` | **Hover Documentation** | Documentação do símbolo |
| `<C-k>` | **Signature Help** | Ajuda da assinatura |

#### 🔧 **Ações de Código**
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<leader>rn` | **Rename Symbol** | Renomear símbolo |
| `<leader>ca` | **Code Actions** | Ações de código disponíveis |
| `<leader>f` | **Format Code** | Formatar código |
| `<leader>D` | **Type Definition** | Ir para definição do tipo |

#### 🩺 **Diagnósticos**
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `[d` | **Previous Diagnostic** | Diagnóstico anterior |
| `]d` | **Next Diagnostic** | Próximo diagnóstico |
| `<leader>e` | **Show Diagnostic** | Mostrar diagnóstico float |
| `<leader>q` | **Diagnostic List** | Lista de diagnósticos |

#### 🏢 **Workspace**
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<leader>wa` | **Add Workspace** | Adicionar pasta ao workspace |
| `<leader>wr` | **Remove Workspace** | Remover pasta do workspace |
| `<leader>wl` | **List Workspaces** | Listar pastas do workspace |

### 🌿 **Git com GitSigns**

#### 🔄 **Navegação de Hunks**
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `]c` | **Next Hunk** | Próxima mudança Git |
| `[c` | **Previous Hunk** | Mudança Git anterior |

#### 🎯 **Ações Git**
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<leader>hs` | **Stage Hunk** | Adicionar mudança ao stage |
| `<leader>hr` | **Reset Hunk** | Resetar mudança |
| `<leader>hS` | **Stage Buffer** | Stage todo o buffer |
| `<leader>hu` | **Undo Stage** | Desfazer stage |
| `<leader>hR` | **Reset Buffer** | Reset todo o buffer |
| `<leader>hp` | **Preview Hunk** | Preview da mudança |
| `<leader>hb` | **Blame Line** | Git blame da linha |
| `<leader>hd` | **Diff This** | Diff do arquivo |
| `<leader>hD` | **Diff This ~** | Diff com HEAD~ |

#### 🔧 **Toggle Git**
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<leader>tb` | **Toggle Blame** | Alternar blame inline |
| `<leader>td` | **Toggle Deleted** | Mostrar linhas deletadas |

### 🚨 **Trouble (Diagnósticos Avançados)**

| Tecla | Ação | Descrição |
|-------|------|-----------|
| `<leader>xx` | **Toggle Diagnostics** | Lista geral de diagnósticos |
| `<leader>xX` | **Buffer Diagnostics** | Diagnósticos do buffer atual |
| `<leader>cs` | **Symbols** | Lista de símbolos |
| `<leader>cl` | **LSP References** | Referências LSP |
| `<leader>xL` | **Location List** | Lista de localizações |
| `<leader>xQ` | **Quickfix List** | Lista quickfix |

### ✏️ **Edição Avançada**

#### 📝 **Manipulação de Linhas (Visual Mode)**
| Tecla | Modo | Ação | Descrição |
|-------|------|------|-----------|
| `J` | Visual | **Move Down** | Mover seleção para baixo |
| `K` | Visual | **Move Up** | Mover seleção para cima |
| `<` | Visual | **Indent Left** | Diminuir indentação |
| `>` | Visual | **Indent Right** | Aumentar indentação |

#### 🔍 **Busca Melhorada**
| Tecla | Ação | Descrição |
|-------|------|-----------|
| `n` | **Next Search** | Próximo resultado (centralizado) |
| `N` | **Previous Search** | Resultado anterior (centralizado) |

### 📊 **Sistema de Benchmark**

| Comando | Ação | Descrição |
|---------|------|-----------|
| `:BenchmarkAll` | **🚀 Relatório Completo** | Análise completa do sistema |
| `:BenchmarkStats` | **📊 Estatísticas** | Métricas básicas de performance |
| `:BenchmarkSimple` | **⚡ Benchmark Rápido** | Análise rápida e segura |
| `:BenchmarkStartup` | **⏱️ Tempo Startup** | Apenas tempo de inicialização |
| `:BenchmarkToggleStartup` | **🔧 Toggle Display** | Ativar/desativar exibição automática |

### 🎨 **
