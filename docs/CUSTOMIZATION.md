# Personalização

[← Voltar ao README](../README.md)

Edite os arquivos no clone que você usa para iniciar o Neovim. Reinicie o editor depois das mudanças para recarregar os módulos. Mantenha suas personalizações em commits próprios para facilitar futuras atualizações.

## Tema e transparência

A paleta e os highlights ficam em [colors/nvim-fusion.lua](../colors/nvim-fusion.lua). O tema local é aplicado em [lua/config/colorscheme.lua](../lua/config/colorscheme.lua), antes dos plugins; também é a preferência de instalação do Lazy. Para experimentar o tema alternativo instalado como plugin lazy, use `:colorscheme tokyonight-night` (ou `tokyonight-storm`, `tokyonight-moon`, `tokyonight-day`). A especificação fica em [lua/plugins/ui/tokyonight.lua](../lua/plugins/ui/tokyonight.lua). Reiniciar restaura o tema local.

| Cor | Hex | Uso na paleta |
|---|---|---|
| Void | `#08050D` | Fundo escuro de referência |
| Abyss | `#0D0816` | Fundo secundário |
| Panel | `#130B20` | Painéis e janelas |
| Neon violet | `#C77DFF` | Destaques |
| Neon fuchsia | `#E879F9` | Acentos |
| Violet | `#A78BFA` | Elementos secundários |
| Fuchsia | `#F0ABFC` | Seleções e realces |
| Pink | `#F472B6` | Acentos complementares |

`Normal` e alguns outros grupos usam `bg = c.none`, permitindo mostrar o fundo do terminal. Opacidade e blur pertencem à configuração do terminal/compositor.

Para um fundo sólido, altere os grupos correspondentes no arquivo do tema, por exemplo:

```lua
hi("Normal", { fg = c.fg, bg = c.void })
hi("NormalNC", { fg = c.fg2, bg = c.void })
hi("SignColumn", { bg = c.void })
hi("EndOfBuffer", { fg = c.dim, bg = c.void })
```

Plugins têm highlights próprios; revise também os grupos do NvimTree se quiser padronizar todos os painéis.

## Fonte e ícones

Selecione uma Nerd Font nas preferências do seu terminal. As imagens usam **JetBrainsMono Nerd Font**. Tamanho da fonte, espaçamento e formato do cursor também dependem do terminal. Não é necessário instalar outro tema para usar as cores do rice.

## Opções do editor

Em [lua/config/options.lua](../lua/config/options.lua), ajuste a tabela `options`. Exemplo:

```lua
relativenumber = true,
tabstop = 4,
shiftwidth = 4,
wrap = true,
```

Os padrões atuais usam números absolutos, indentação com dois espaços, linhas sem quebra visual e clipboard `unnamedplus`. Swap e backup estão desabilitados; undo persistente não está habilitado.

## Atalhos

Atalhos gerais ficam em [lua/config/keymaps.lua](../lua/config/keymaps.lua). Exemplo de um novo mapa:

```lua
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", {
  desc = "Próximo buffer",
})
```

Antes de escolher uma combinação, consulte [Atalhos](KEYMAPS.md). Para investigar um conflito, use `:verbose nmap <leader>bn`.

## Adicionar um plugin

Crie um arquivo na categoria correspondente e importe-o no `init.lua` dessa categoria. Exemplo de estrutura para um plugin utilitário:

```lua
-- lua/plugins/util/meu-plugin.lua
return {
  {
    "autor/repositorio", -- substitua pelo repositório real
    opts = {},
  },
}
```

No retorno de `lua/plugins/util/init.lua`, acrescente:

```lua
{ import = "plugins.util.meu-plugin" },
```

Reinicie, instale pelo Lazy e revise a alteração em `lazy-lock.json`. Para remover um plugin, remova a especificação/importação correspondente e confira a limpeza proposta pelo Lazy.

## Adicionar uma linguagem

1. Acrescente o nome de configuração do servidor em [config/servers.lua](../lua/config/servers.lua), se o pacote for suportado pelo Mason. Essa lista alimenta `ensure_installed` e `vim.lsp.enable`.
2. Em [plugins/lsp/servers.lua](../lua/plugins/lsp/servers.lua), use `vim.lsp.config` para opções específicas, reutilizando `capabilities`. Os atalhos comuns vêm de `LspAttach` em [config/autocmds.lua](../lua/config/autocmds.lua); preserve os callbacks próprios dos servidores.
3. Se houver um parser correspondente, adicione-o em [plugins/treesitter/init.lua](../lua/plugins/treesitter/init.lua).
4. Reinicie em sessão interativa, espere a instalação em `:Mason` e abra um projeto da linguagem para validar a conexão com `:checkhealth vim.lsp`.

Instalar no Mason, configurar/habilitar no Neovim e conectar o cliente são etapas diferentes. O nome do parser também pode ser diferente do nome do servidor. Para CI/headless, atualize os casos em `scripts/bootstrap_lsp.lua` e os testes de LSP conforme necessário; o lockfile não fixa a versão dos binários baixados pelo Mason.

## Dashboard e painéis

| Parte | Arquivo |
|---|---|
| Logo e botões da tela inicial | [alpha.lua](../lua/plugins/ui/alpha.lua) |
| Statusline | [lualine.lua](../lua/plugins/ui/lualine.lua) |
| Abas de buffers | [bufferline.lua](../lua/plugins/ui/bufferline.lua) |
| Largura e ícones da árvore | [nvim-tree.lua](../lua/plugins/editor/nvim-tree.lua) |
| Busca e mapeamentos do Telescope | [telescope.lua](../lua/plugins/editor/telescope.lua) |
| Aparência dos diagnósticos | [diagnostics.lua](../lua/config/diagnostics.lua) |

Depois de mudar o visual, atualize as [imagens do README](images/README.md).
