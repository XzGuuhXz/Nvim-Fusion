# Solução de problemas

[← Voltar ao README](../README.md)

Comece com `:messages` e `:checkhealth`. Na instalação isolada, abra sempre com `NVIM_APPNAME=nvim-fusion nvim` para inspecionar os plugins e caminhos corretos.

## O editor não carrega a configuração

Confira `nvim --version`: o projeto exige 0.12 ou superior. Dentro do editor, `:echo stdpath('config')` mostra o diretório esperado. O `init.lua` deve estar diretamente nessa pasta.

Se um módulo não for encontrado, confira se o clone está completo e consulte os erros em `:messages`.

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

1. Confira em `:Mason` se o servidor terminou de instalar.
2. Abra um arquivo da linguagem e consulte `:set filetype?`.
3. Execute `:checkhealth vim.lsp` para verificar servidores e clientes.
4. Confira as dependências externas e a identificação da raiz do projeto.
5. Consulte `:messages` e, se necessário, o log cujo caminho aparece em `:lua print(vim.lsp.log.get_filename())`.

Apenas os sete servidores listados no README são habilitados. Instalar um servidor adicional no Mason não altera `vim.lsp.enable` automaticamente.

## Formatação não funciona em Python

Pyright fornece análise de código e completion, mas não formatação. `Espaço lf` chama `vim.lsp.buf.format`; é necessário configurar uma ferramenta que ofereça formatação para Python. A configuração não inclui essa integração adicional.

## Treesitter não instala parsers

Confira `tree-sitter --version` e a disponibilidade de um compilador C. O CI usa tree-sitter CLI 0.26.9. Sem o CLI, a configuração avisa e não instala os parsers automaticamente.

Depois de instalar as dependências, reinicie e execute:

```vim
:TSUpdate
:checkhealth nvim-treesitter
```

A instalação de parsers exige downloads. Destaque de sintaxe não confirma que um LSP está conectado.

## Clipboard não funciona

O rice usa `clipboard = "unnamedplus"`. Execute `:checkhealth vim.provider` para identificar o provider disponível. Em Linux, sessões Wayland normalmente usam `wl-copy`/`wl-paste`; em X11, `xclip` ou `xsel`. A ferramenta precisa estar instalada e ter acesso à sessão gráfica.

## Sinais de diagnóstico ou histórico de undo ausentes

Os textos dos sinais de diagnóstico estão vazios em `lua/config/diagnostics.lua`; os diagnósticos continuam disponíveis como texto virtual, sublinhado e janelas flutuantes. Undo persistente não está habilitado por padrão. Altere essas opções se desejar outro comportamento.

## Falha nos testes

Execute os comandos da seção de testes do README a partir da raiz do clone. O teste `lock` exige que os plugins instalados correspondam ao lockfile; confira `:Lazy restore`. O teste `health` gera `test-results/health.txt` e verifica Lazy/Treesitter; não é uma validação de todos os providers opcionais.

Ao abrir uma issue, envie o comando executado, o erro e as versões das ferramentas. Remova informações pessoais dos logs antes de compartilhá-los.
