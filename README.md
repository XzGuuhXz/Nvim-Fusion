<div align="center">

# NVIM FUSION

**Seu código, em neon.**

Um rice para Neovim escrito em Lua, com tema próprio, navegação por teclado e um ambiente de desenvolvimento modular.

[![Neovim 0.12+](https://img.shields.io/badge/Neovim-0.12%2B-C77DFF?style=for-the-badge&logo=neovim&logoColor=white)](#requisitos)
[![Lua](https://img.shields.io/badge/feito_em-Lua-A78BFA?style=for-the-badge&logo=lua&logoColor=white)](lua/)
[![MIT](https://img.shields.io/badge/licença-MIT-E879F9?style=for-the-badge)](LICENSE)
[![CI](https://github.com/XzGuuhXz/Nvim-Fusion/actions/workflows/nvim.yml/badge.svg)](https://github.com/XzGuuhXz/Nvim-Fusion/actions/workflows/nvim.yml)

[Visual](#visual) · [Instalação](#instalação) · [Atalhos](docs/KEYMAPS.md) · [Personalização](docs/CUSTOMIZATION.md) · [Problemas comuns](docs/TROUBLESHOOTING.md)

</div>

![NVIM FUSION com tema violeta, árvore de arquivos, código Lua e statusline](docs/images/editor.png)

## Sobre o rice

O **NVIM FUSION** combina o tema **Neon Cyberpunk** com busca de arquivos e texto, autocomplete, snippets, diagnósticos e integração com Git. A paleta mistura fundos escuros, violeta, magenta e fúcsia; os módulos em Lua permitem ajustar cada parte da configuração.

O repositório configura o Neovim. Fonte, transparência, blur e papel de parede são configurados separadamente no terminal ou compositor.

## Visual

### Tela inicial

![Dashboard Alpha com logo do Neovim e atalhos de entrada](docs/images/dashboard.png)

### Busca de arquivos

![Telescope aberto sobre o editor com lista de arquivos e prévia](docs/images/telescope.png)

As imagens mostram a interface real da configuração, capturada pela API de UI do Neovim e renderizada em PNG com JetBrainsMono Nerd Font e fundo sólido `#08050D`. A aparência do fundo no seu terminal depende da transparência configurada. Veja [como atualizar as imagens](docs/images/README.md).

## O que vem incluído

| Área | Componentes e recursos |
|---|---|
| Visual | Tema local `nvim-fusion`, Alpha, Lualine, Bufferline e ícones |
| Navegação | NvimTree, Telescope e Which-Key |
| Código | LSP nativo, nvim-lspconfig, Mason e diagnósticos |
| Autocomplete | nvim-cmp, LuaSnip e friendly-snippets; fontes de LSP, buffer e caminhos |
| Sintaxe | Treesitter, guias de indentação e visualização de cores |
| Git | Gitsigns: alterações na margem, hunks, stage, blame e diff |
| Diagnósticos | Trouble para diagnósticos, símbolos, quickfix e referências |
| Edição | Autopairs, Comment.nvim e atalhos para mover linhas e janelas |
| Plugins | Lazy.nvim e revisões registradas em `lazy-lock.json` |

### Linguagens

| Linguagem | Servidor LSP configurado |
|---|---|
| Lua | `lua_ls` |
| Python | `pyright` |
| JavaScript / TypeScript | `ts_ls` |
| JSON | `jsonls` |
| HTML | `html` |
| CSS | `cssls` |
| C / C++ / Objective-C / Objective-C++ | `clangd` |

Mason solicita a instalação desses sete servidores; a ativação é feita explicitamente em [servers.lua](lua/plugins/lsp/servers.lua). A instalação depende de rede e das ferramentas exigidas por cada servidor.

Treesitter também solicita parsers de Lua, Vim, help, queries, Python, JavaScript, TypeScript, TSX, HTML, CSS, JSON, YAML, Bash, Markdown, C e C++. **Destaque de sintaxe e LSP são recursos diferentes:** Bash e YAML têm parser, mas não têm LSP habilitado aqui.

`Espaço lf` usa a formatação oferecida pelo servidor conectado. Pyright não formata Python; esse caso exige um formatador adicional. Instalar outro servidor pelo Mason, por si só, não o habilita.

## Requisitos

Os comandos abaixo são para Linux com Bash. Em outros sistemas, adapte os caminhos e a instalação das dependências.

| Dependência | Finalidade |
|---|---|
| **Neovim 0.12+** | Versão mínima verificada pelo `init.lua`; CI configurado para **0.12.5** |
| Git | Clonar a configuração e baixar plugins |
| Acesso à internet | Primeira instalação de plugins, servidores e parsers |
| Terminal com true color | Exibir a paleta do tema |
| Nerd Font selecionada no terminal | Exibir ícones; não é instalada pelo rice |
| `ripgrep` (`rg`) | Busca de texto do Telescope |
| `fd` / `fdfind` | Ferramenta auxiliar para busca de arquivos |
| Node.js e npm | Servidores distribuídos via npm, como Pyright e TypeScript |
| Compilador C, make e ferramentas de extração | Compilação de parsers e instalação de ferramentas |
| tree-sitter CLI | Compilar/atualizar parsers; referência do CI: **0.26.9** |
| Provedor de clipboard | Integração com área de transferência; confira `:checkhealth vim.provider` |

Python deve estar disponível para executar seus projetos Python. O Pyright usado pelo Mason depende de Node.js; o provider Python do Neovim é um recurso separado.

Antes de começar, confira o que está disponível:

```bash
nvim --version
git --version
rg --version
node --version
npm --version
tree-sitter --version
```

## Instalação

### Preparar as dependências

Em Debian/Ubuntu, as ferramentas usadas pelo workflow do projeto podem ser instaladas com:

```bash
sudo apt update
sudo apt install git curl unzip ripgrep fd-find nodejs npm \
  build-essential cmake gettext ninja-build
```

Instale o Neovim 0.12+ pelo gerenciador da sua distribuição, se ele oferecer essa versão, ou compile conforme o [workflow do projeto](.github/workflows/nvim.yml). Confira `nvim --version` antes de continuar: instalar o pacote `neovim` não garante a versão mínima.

Para reproduzir a versão do CLI usada pelo CI, em uma instalação de Node com prefixo global gravável pelo seu usuário:

```bash
npm install --global tree-sitter-cli@0.26.9
```

Se houver erro de permissão, ajuste sua instalação/prefixo do npm ou use o pacote da distribuição, conferindo a versão. Configure também uma Nerd Font no terminal e, caso use clipboard, o provider apropriado à sua sessão. Em outras distribuições, instale os equivalentes da tabela de requisitos.

### 1. Escolha como instalar

#### Experimentar sem substituir seu Neovim

O nome `nvim-fusion` separa configuração, plugins, estado e cache da instalação padrão:

```bash
git clone https://github.com/XzGuuhXz/Nvim-Fusion.git \
  "${XDG_CONFIG_HOME:-$HOME/.config}/nvim-fusion"
NVIM_APPNAME=nvim-fusion nvim
```

Use `NVIM_APPNAME=nvim-fusion nvim` sempre que quiser abrir essa instalação. Se desejar, adicione ao seu `~/.bashrc` ou `~/.zshrc`:

```bash
alias fusion='NVIM_APPNAME=nvim-fusion nvim'
```

#### Usar como configuração principal

Feche suas sessões do Neovim. O bloco abaixo preserva configuração, plugins, estado e cache existentes, respeitando os caminhos XDG:

```bash
backup_stamp="$(date +%Y%m%d-%H%M%S)"
for nvim_dir in \
  "${XDG_CONFIG_HOME:-$HOME/.config}/nvim" \
  "${XDG_DATA_HOME:-$HOME/.local/share}/nvim" \
  "${XDG_STATE_HOME:-$HOME/.local/state}/nvim" \
  "${XDG_CACHE_HOME:-$HOME/.cache}/nvim"
do
  if [ -e "$nvim_dir" ] || [ -L "$nvim_dir" ]; then
    mv -- "$nvim_dir" "$nvim_dir.backup-$backup_stamp" || break
  fi
done
```

Confirme que os backups foram criados antes de continuar. Então clone e abra:

```bash
git clone https://github.com/XzGuuhXz/Nvim-Fusion.git \
  "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
nvim
```

### 2. Aguarde a instalação

Na primeira abertura, Lazy.nvim é inicializado e instala os plugins. Mason solicita os servidores configurados, e Treesitter instala os parsers quando o CLI está disponível. Aguarde os downloads e a compilação antes de fechar.

Para alinhar os plugins às revisões registradas no repositório, execute dentro do Neovim:

```vim
:Lazy restore
```

Espere a conclusão e reinicie o editor. `:Lazy sync` também atualiza plugins e pode alterar o lockfile; use esse comando quando quiser atualizar as dependências.

### 3. Confira a instalação

```vim
:Lazy
:Mason
:checkhealth
```

Verifique se não há tarefas com falha. Abra um arquivo de uma linguagem configurada e consulte `:checkhealth vim.lsp` para conferir a conexão do servidor. Providers opcionais podem aparecer no relatório sem impedir a edição.

### 4. Abra seu projeto

```bash
cd /caminho/do/seu/projeto
nvim .
# Na instalação isolada:
# NVIM_APPNAME=nvim-fusion nvim .
```

Pressione `Espaço e` para explorar arquivos, `Espaço ff` para buscar um arquivo e `Espaço fg` para buscar texto. No modo normal, pressione `Espaço` e aguarde o Which-Key mostrar os atalhos disponíveis.

## Primeiros passos

`<leader>` significa **Espaço**. `Espaço ff` significa pressionar Espaço, f, f em sequência, no modo normal. Pressione `Esc` para voltar a esse modo.

| Atalho | Ação |
|---|---|
| `i` / `Esc` | Entrar / sair do modo de inserção |
| `Espaço w` / `Espaço q` | Salvar / fechar a janela atual |
| `Espaço e` | Abrir ou fechar a árvore de arquivos |
| `Espaço ff` / `Espaço fg` | Buscar arquivo / texto no projeto |
| `Espaço fb` | Selecionar um buffer aberto |
| `Ctrl-h/j/k/l` | Mover entre janelas |
| `gd` / `gr` / `K` | Definição / referências / documentação com LSP |
| `Espaço rn` / `Espaço ca` | Renomear símbolo / ações de código |
| `Espaço lf` | Solicitar formatação ao LSP |
| `Espaço xx` | Abrir diagnósticos no Trouble |
| `Tab` / `Shift-Tab` | Navegar nas sugestões ou nos campos de snippet |
| `Enter` | Confirmar sugestão de autocomplete |

A lista detalhada, incluindo **Git, seleção, completion e dashboard**, está em [Atalhos](docs/KEYMAPS.md).

## Personalização

A configuração é organizada por responsabilidade:

```text
nvim/
├── init.lua                    # Entrada e verificação de versão
├── lazy-lock.json              # Revisões dos plugins
├── colors/nvim-fusion.lua      # Paleta e highlights
├── lua/
│   ├── config/                 # Opções, atalhos, diagnósticos, LSP e Lazy
│   └── plugins/
│       ├── editor/             # Telescope, NvimTree e Which-Key
│       ├── git/                # Gitsigns
│       ├── lsp/                # Mason, servidores e completion
│       ├── treesitter/         # Parsers e destaque de sintaxe
│       ├── ui/                 # Dashboard, tema, statusline e interface
│       └── util/               # Autopairs e comentários
├── docs/                       # Guias e imagens
└── tests/                      # Configuração, regressões, tema, health e lock
```

Veja [Personalização](docs/CUSTOMIZATION.md) para mudar cores, fundo, indentação, atalhos, plugins e linguagens.

## Atualização e restauração

No diretório em que você clonou o rice:

```bash
git status
git pull --ff-only
```

Se houver alterações pessoais, salve-as em um commit ou backup antes de atualizar. Depois, abra o Neovim e execute `:Lazy restore` para usar as revisões do lockfile recebido. Atualizações deliberadas dos plugins podem ser feitas com `:Lazy update`; revise o `lazy-lock.json` e teste antes de versionar.

Para voltar à configuração anterior, feche o Neovim, mova os diretórios atuais para um nome de reserva e devolva cada pasta `.backup-DATA-HORA` ao caminho original. Restaure configuração, dados, estado e cache do mesmo backup. Na instalação isolada, basta voltar a executar `nvim` sem `NVIM_APPNAME`.

## Problemas comuns

Ícones ausentes, LSP sem resposta, busca vazia, parsers e clipboard têm um guia próprio: [Solução de problemas](docs/TROUBLESHOOTING.md).

Para relatar um problema, abra uma [issue](https://github.com/XzGuuhXz/Nvim-Fusion/issues) com sistema operacional, terminal, versão do Neovim, passos para reproduzir e o trecho relevante de `:checkhealth` ou `:messages`.

## Desenvolvimento e testes

A partir da raiz do clone, com plugins e ferramentas instalados:

```bash
for test in config regression theme health lock; do
  NVIM_FUSION_TEST="tests/${test}_test.lua" \
    nvim --headless -u init.lua +"luafile tests/run.lua" || exit 1
done
```

O runner retorna falha para exceções e erros de inicialização. Os testes cobrem configuração, mapas, regressões de Treesitter/NvimTree/diff, tema, health de Lazy/Treesitter e revisões dos plugins. O relatório de health é salvo em `test-results/health.txt`. A conexão real de cada LSP depende de seu executável e do projeto aberto.

O [workflow de CI](.github/workflows/nvim.yml) está configurado para Neovim **0.12.5**, tree-sitter CLI **0.26.9** e `:Lazy! restore`, em pushes e pull requests para `main`.

Para explorar o tema interativamente:

```bash
nvim -u init.lua +"luafile tests/theme_test.lua"
```

Contribuições são bem-vindas. Descreva o problema e a mudança, execute os testes relevantes e inclua capturas quando alterar o visual.

## Licença

Distribuído sob a [licença MIT](LICENSE).
