# Solução de problemas

[← Voltar ao README](../README.md)

Comece com `:messages` e `:checkhealth`. Na instalação isolada, execute `nvim -u init.lua` a partir do clone com diretórios `XDG_DATA_HOME`, `XDG_STATE_HOME`, `XDG_CACHE_HOME` e `XDG_CONFIG_HOME` novos, como no [guia de instalação isolada](../README.md#instalação-isolada-em-modo-headless). `NVIM_APPNAME` sozinho pode apontar para outra configuração se não existir um clone naquele caminho.

## O editor não carrega a configuração

Confira `nvim --version`: o projeto exige 0.12 ou superior. Dentro do editor, `:echo stdpath('config')` mostra o diretório esperado. O `init.lua` deve estar diretamente nessa pasta.

Se um módulo não for encontrado, confira se o clone está completo e consulte os erros em `:messages`. Quando executar com `-u init.lua` fora de `~/.config/nvim`, consulte o caminho guardado em `:lua print(vim.g.nvim_fusion_root)`.

## Plugins não instalaram ou há erros após atualizar

Abra `:Lazy` e consulte a tarefa que falhou. Confira Git, conexão e permissões nos diretórios do Neovim. Para voltar às versões do lockfile, execute `:Lazy restore`, aguarde e reinicie.

`:Lazy sync` pode atualizar dependências e modificar `lazy-lock.json`. Antes de usar, confira se você quer atualizar ou restaurar as versões do projeto.

## Ícones viraram quadrados

Instale uma Nerd Font e selecione-a como fonte do terminal. Instalar a fonte sem selecioná-la não muda a renderização. Reinicie o terminal se necessário.

## O fundo não parece com a imagem

As capturas usam fundo sólido `#08050D`. O tema deixa o fundo de alguns grupos transparente, então sua cor real depende do terminal. Ajuste opacidade/blur no terminal ou use as instruções de [fundo sólido](CUSTOMIZATION.md#tema-e-transparência).

## Telescope não encontra texto ou arquivos

`live_grep` depende de `rg`: confira `rg --version` no terminal. Abra o Neovim a partir do diretório do projeto ou confira `:pwd`.

Arquivos ocultos e ignorados pelo Git podem ficar fora da busca padrão. `Ctrl-p` usa arquivos Git e exige um repositório. Use `Espaço ff` para a busca geral.

## O LSP não inicia

1. Abra o editor em uma sessão interativa e aguarde `:Mason` terminar. `ensure_installed` do mason-lspconfig não é executado em headless; para CI, rode [scripts/bootstrap_lsp.lua](../scripts/bootstrap_lsp.lua) conforme o README.
2. Confira em `:Mason` o pacote instalado e seu executável. Pyright, `ts_ls`, JSON, HTML e CSS exigem Node.js/npm. `clangd` e `lua_ls` precisam de binários compatíveis com a plataforma; rede e permissões também importam.
3. Abra um arquivo da linguagem e consulte `:set filetype?` e `:LspInfo`. Se ele já estava aberto durante o download, tente reabri-lo após a instalação.
4. Execute `:checkhealth vim.lsp` para verificar configuração, clientes e detecção da raiz do projeto. TypeScript requer projeto e versão compatível, e projetos C/C++ se beneficiam de `compile_commands.json`.
5. Consulte `:messages` e, se necessário, o log cujo caminho aparece em `:lua print(vim.lsp.log.get_filename())`.

Apenas os sete servidores listados no README são habilitados. Instalar um servidor adicional no Mason não altera `vim.lsp.enable` automaticamente. O `lazy-lock.json` fixa a revisão dos plugins, não as versões dos servidores baixados.

## Formatação não funciona em Python

Pyright fornece análise de código e completion, mas não formatação. `Espaço lf` chama `vim.lsp.buf.format`; é necessário configurar uma ferramenta que ofereça formatação para Python. A configuração não inclui essa integração adicional.

## Treesitter não instala parsers

Confira `tree-sitter --version` e a disponibilidade de um compilador C. O CI usa tree-sitter CLI 0.26.9. Sem o CLI, a configuração avisa e não instala os parsers automaticamente.

Também são necessários `curl` e `tar` para obter parsers e um compilador C para compilá-los. Depois de instalar as dependências, reinicie e execute:

```vim
:TSUpdate
:checkhealth nvim-treesitter
```

A instalação de parsers exige downloads. A configuração tenta ativar o destaque também em buffers já abertos quando a instalação termina; se o destaque continuar ausente, reabra o arquivo e consulte `:messages`. Destaque de sintaxe não confirma que um LSP está conectado.

## Clipboard não funciona

O rice usa `clipboard = "unnamedplus"`. Execute `:checkhealth vim.provider` para identificar o provider disponível. Em Linux, sessões Wayland normalmente usam `wl-copy`/`wl-paste`; em X11, `xclip` ou `xsel`. A ferramenta precisa estar instalada e ter acesso à sessão gráfica.

## Sinais de diagnóstico ou histórico de undo ausentes

Os textos dos sinais de diagnóstico estão vazios em `lua/config/diagnostics.lua`; os diagnósticos continuam disponíveis como texto virtual, sublinhado e janelas flutuantes. Undo persistente não está habilitado por padrão. Altere essas opções se desejar outro comportamento.

## Falha nos testes

Execute os comandos da seção de testes do README a partir da raiz do clone. O teste `lock` exige que os plugins instalados correspondam ao lockfile; confira `:Lazy restore`. O teste `health` gera `test-results/health.txt` e verifica Lazy/Treesitter; não é uma validação de todos os providers opcionais.

Ao abrir uma issue, envie o comando executado, o erro e as versões das ferramentas. Remova informações pessoais dos logs antes de compartilhá-los.
