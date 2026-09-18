# Imagens do rice

[← Voltar ao README](../../README.md)

| Arquivo | Conteúdo |
|---|---|
| `editor.png` | Código Lua com NvimTree e Lualine |
| `dashboard.png` | Tela inicial do Alpha |
| `telescope.png` | Busca de arquivos com prévia |

As imagens desta revisão foram capturadas de uma sessão real do Neovim 0.12.5 pela API de UI (`ext_linegrid`), com a configuração local carregada. As células e seus highlights foram renderizados em PNG usando JetBrainsMono Nerd Font, grade de 140 × 40 e fundo `#08050D` para as áreas transparentes. Não são imagens geradas por IA nem capturas do desktop; o renderizador não reproduz efeitos do terminal, como blur.

Para atualizar as imagens por captura do seu terminal:

1. Abra o Neovim na raiz do repositório, com uma Nerd Font e true color.
2. Para o editor, abra `lua/plugins/lsp/servers.lua`, execute `:NvimTreeOpen` e volte o foco ao código.
3. Para o dashboard, abra uma sessão sem arquivo ou execute `:Alpha`.
4. Para a busca, execute `:Telescope find_files` na raiz do repositório.
5. Aguarde downloads e notificações terminarem. Capture apenas a janela do editor, evitando caminhos ou arquivos pessoais.
6. Salve os PNGs com os nomes acima e confira a legibilidade no README.

Caso use capturas convencionais do terminal, atualize também a descrição do método no README principal e neste arquivo.
