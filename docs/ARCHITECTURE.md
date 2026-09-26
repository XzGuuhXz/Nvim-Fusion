# Arquitetura e manutenção

[← Voltar ao README](../README.md) · [Personalização](CUSTOMIZATION.md) · [Atalhos](KEYMAPS.md) · [Solução de problemas](TROUBLESHOOTING.md)

## Caminho de inicialização

1. [`init.lua`](../init.lua) localiza a raiz do clone, incluindo quando o editor é iniciado com `-u /caminho/para/init.lua`.
2. [`lua/config/init.lua`](../lua/config/init.lua) carrega opções, atalhos gerais, diagnósticos, autocmds e o tema local.
3. [`lua/config/lazy.lua`](../lua/config/lazy.lua) instala o Lazy.nvim no commit gravado em `lazy-lock.json` se ainda não estiver presente e importa as especificações de `lua/plugins/`.
4. Plugins carregam segundo seus eventos, comandos, atalhos e dependências declarados. A ordem de abertura do editor pode ser diferente da ordem de instalação de um pacote Mason.

| Caminho | Responsabilidade |
|---|---|
| `colors/nvim-fusion.lua` | Paleta local e grupos de destaque; tema padrão. |
| `lua/config/options.lua`, `keymaps.lua`, `diagnostics.lua` | Comportamento global do editor. |
| `lua/config/autocmds.lua`, `lsp.lua` | Evento `LspAttach` e mapas locais comuns aos buffers com LSP. |
| `lua/config/colorscheme.lua` | Aplicação do tema local antes de carregar plugins. |
| `lua/config/lazy.lua` | Bootstrap e opções do gerenciador de plugins. |
| `lua/config/servers.lua` | Lista única dos sete nomes de configurações de LSP. |
| `lua/plugins/editor/` | NvimTree, Telescope e Which-Key. |
| `lua/plugins/git/` | Gitsigns e seus atalhos de hunk. |
| `lua/plugins/lsp/` | Mason, mason-lspconfig, nvim-lspconfig, nvim-cmp e LuaSnip. |
| `lua/plugins/treesitter/` | Parsers, instalação assíncrona e destaque por tipo de arquivo. |
| `lua/plugins/ui/` | Lualine, Bufferline, Trouble, Alpha, cores adicionais e TokyoNight opcional. |
| `lua/plugins/util/` | Comment.nvim e autopairs. |
| `scripts/`, `tests/` | Bootstrap headless e verificações automáticas. |

## LSP: três etapas verificáveis

Os servidores pretendidos são `lua_ls`, `pyright`, `ts_ls`, `jsonls`, `html`, `cssls` e `clangd`.

| Etapa | Código | Como conferir |
|---|---|---|
| Instalação | `ensure_installed` em [`mason.lua`](../lua/plugins/lsp/mason.lua), ou [`scripts/bootstrap_lsp.lua`](../scripts/bootstrap_lsp.lua) em headless. | Pacote instalado em `:Mason`; teste `tests/lsp_install_test.lua`. |
| Configuração e habilitação | [`plugins/lsp/servers.lua`](../lua/plugins/lsp/servers.lua) usa `vim.lsp.config` e `vim.lsp.enable`. | `:checkhealth vim.lsp`; teste de configuração. |
| Conexão ao arquivo | Neovim inicia o cliente quando o buffer e a raiz correspondem ao servidor. | `:LspInfo`, `vim.lsp.get_clients({ bufnr = 0 })` e `tests/lsp_attach_test.lua`. |

Os sete nomes são mantidos em [`config/servers.lua`](../lua/config/servers.lua). Mason traduz nomes de configuração em pacotes, como `ts_ls` → `typescript-language-server`; não renomeie `ts_ls` para `tsserver`. O callback de `LspAttach` adiciona mapas comuns sem sobrescrever callbacks próprios da configuração upstream. A notificação de instalação do Mason tenta ativar os servidores para buffers já abertos. Se o cliente ainda não se conectar, reabra o arquivo e consulte o log de LSP.

O `mason-lspconfig` da revisão travada pula `ensure_installed` em headless. Na inicialização de uma TUI, Mason pode ser avaliado antes da interface anexar; `mason.lua` confere novamente os pacotes em `UIEnter` para iniciar os sete downloads ausentes. O script explícito para CI aguarda e relata falha por pacote; iniciar `nvim --headless` por si só não comprova instalação. `lazy-lock.json` fixa **plugins**, não servidores Mason, parsers ou ferramentas do sistema.

## Tema e interface

O tema local `nvim-fusion` continua padrão. TokyoNight é carregado sob demanda por `:colorscheme tokyonight-night` (ou `tokyonight-storm`, `tokyonight-moon`, `tokyonight-day`); sua especificação é [`lua/plugins/ui/tokyonight.lua`](../lua/plugins/ui/tokyonight.lua). A Lualine mantém os ícones Nerd Font para Normal, Insert e os três modos visuais (`v`, `V` e Ctrl-V). Uma Nerd Font deve estar selecionada no terminal.

## Mudanças seguras

1. Mude uma responsabilidade no arquivo correspondente; leia primeiro os [atalhos existentes](KEYMAPS.md) para evitar conflitos.
2. Ao adicionar um LSP, atualize a lista única, sua configuração específica quando necessária, e os testes. Confirme disponibilidade do pacote no Mason e requisitos do executável. Ao adicionar parser, consulte [`plugins/treesitter/init.lua`](../lua/plugins/treesitter/init.lua).
3. Para versões de plugins, altere intencionalmente o lockfile e valide depois; `:Lazy restore` aplica versões travadas e `:Lazy sync` pode atualizá-las. Revise o diff do lockfile antes de publicar.
4. Verifique inicialização, testes de configuração/regressão/tema/health e os sete clientes em um ambiente isolado. Veja os comandos em [Testes](../README.md#-testes).
5. Confira a versão mínima do Neovim (0.12+), Node.js/npm, CLI `tree-sitter` 0.26.1+, compilador C, `curl`, `tar`, Git e rede antes de atribuir uma falha à configuração.

Os testes headless e os testes em sessão interativa têm condições diferentes; registre o comando e os diretórios XDG usados em qualquer relato de falha.
