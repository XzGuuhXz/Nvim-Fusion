local group = vim.api.nvim_create_augroup("NvimFusionLsp", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(event)
    require("config.lsp").on_attach(nil, event.buf)
  end,
})
