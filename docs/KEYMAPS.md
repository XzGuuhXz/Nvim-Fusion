# Atalhos

[← Voltar ao README](../README.md)

`<leader>` = **Espaço**. Os atalhos são do modo normal, exceto quando indicado. `Ctrl` representa uma combinação de teclas; `Espaço ff` é uma sequência. Maiúsculas e minúsculas fazem diferença.

## Arquivos e busca

| Atalho | Ação |
|---|---|
| `Espaço e` | Alternar NvimTree |
| `Espaço o` | Focar NvimTree |
| `Espaço pv` | Abrir NvimTree |
| `Espaço fe` | Localizar arquivo atual na árvore |
| `Espaço ff` / `Espaço pf` | Buscar arquivos |
| `Espaço fg` | Buscar texto com live grep |
| `Espaço ps` | Digitar um termo para buscar no projeto |
| `Espaço fb` / `Espaço pb` | Listar buffers |
| `Ctrl-p` | Buscar arquivos Git |

No Telescope, `Ctrl-h` em modo de inserção mostra ajuda sobre as ações disponíveis. A busca usa o diretório de trabalho atual; abra o Neovim a partir da raiz do projeto.

## Editor

| Atalho | Ação | Modo |
|---|---|---|
| `Espaço w` | Salvar arquivo | Normal |
| `Espaço q` | Fechar janela atual; alterações não salvas impedem a saída | Normal |
| `Ctrl-h/j/k/l` | Janela à esquerda/abaixo/acima/à direita | Normal |
| `J` / `K` | Mover linhas selecionadas para baixo/cima | Visual |
| `<` / `>` | Recuar/indentar mantendo seleção | Visual |
| `n` / `N` | Próxima/anterior ocorrência e centralizar cursor | Normal |
| `gcc` | Alternar comentário na linha, pelo Comment.nvim | Normal |
| `gc` | Alternar comentário na seleção, pelo Comment.nvim | Visual |

## LSP

Estes mapas são registrados no buffer quando um servidor se conecta. A ação depende das capacidades do servidor.

| Atalho | Ação |
|---|---|
| `gd` / `gD` | Definição / declaração |
| `gi` / `gr` | Implementação / referências |
| `K` | Documentação do símbolo |
| `Espaço ls` | Ajuda da assinatura |
| `Espaço rn` | Renomear símbolo |
| `Espaço ca` | Ações de código; também disponível em modo visual |
| `Espaço lf` | Formatar com LSP, de forma assíncrona |
| `[d` / `]d` | Diagnóstico anterior / próximo |
| `Espaço d` | Diagnóstico em janela flutuante |

## Completion e snippets

Em modo de inserção (Tab e Shift-Tab também no modo de seleção de snippet):

| Atalho | Ação |
|---|---|
| `Ctrl-Space` | Abrir sugestões |
| `Ctrl-e` | Cancelar sugestões |
| `Enter` | Confirmar item; pode selecionar o primeiro automaticamente |
| `Tab` | Próxima sugestão; expandir ou avançar no snippet; senão, Tab normal |
| `Shift-Tab` | Sugestão ou campo de snippet anterior |
| `Ctrl-b` / `Ctrl-f` | Rolar documentação para cima / baixo |

O completion também está configurado para buscas `/` e `?` e comandos `:`.

## Git

Disponíveis quando o Gitsigns se conecta ao buffer. Um *hunk* é um bloco de linhas alteradas.

| Atalho | Ação |
|---|---|
| `[c` / `]c` | Hunk anterior / próximo; mantém navegação nativa em modo diff |
| `Espaço hs` | Stage do hunk; aceita seleção visual |
| `Espaço hr` | **Descartar alterações** do hunk; aceita seleção visual |
| `Espaço hS` | Stage do arquivo |
| `Espaço hu` | Desfazer stage do hunk |
| `Espaço hR` | **Descartar alterações** do arquivo |
| `Espaço hp` | Prévia do hunk |
| `Espaço hb` | Blame completo da linha |
| `Espaço tb` | Alternar blame na linha atual |
| `Espaço hd` | Abrir diff |
| `Espaço hD` | Diff contra a revisão `~` |
| `ih` | Selecionar hunk como objeto de texto, em modo visual/operador |

Os mapas refletem [gitsigns.lua](../lua/plugins/git/gitsigns.lua). A compatibilidade de comandos deve ser revisada ao atualizar a versão do plugin.

## Trouble

| Atalho | Ação |
|---|---|
| `Espaço xx` | Diagnósticos do projeto |
| `Espaço xX` | Diagnósticos do buffer |
| `Espaço cs` | Símbolos |
| `Espaço cl` | Painel LSP à direita |
| `Espaço xL` | Location list |
| `Espaço xQ` | Quickfix list |

## Dashboard

Na tela inicial do Alpha:

| Tecla | Ação |
|---|---|
| `f` | Buscar arquivo |
| `e` | Criar buffer vazio |
| `r` | Arquivos recentes |
| `t` | Buscar texto |
| `c` | Abrir configuração |
| `q` | Sair |

Fontes: [mapas gerais](../lua/config/keymaps.lua), [LSP](../lua/config/lsp.lua), [editor](../lua/plugins/editor/), [completion](../lua/plugins/lsp/cmp.lua), [Trouble](../lua/plugins/ui/trouble.lua) e [Alpha](../lua/plugins/ui/alpha.lua).
