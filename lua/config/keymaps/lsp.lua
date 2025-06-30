local function setLSPKeyBind(key, func, desc)
  vim.keymap.set('n', '<C-l>' .. key, func, { desc = (desc or 'LSP ') .. key })
end

setLSPKeyBind('f', function()
  vim.lsp.buf.format()
end, 'LSP Format')

setLSPKeyBind('r', function()
  vim.lsp.buf.rename()
end, 'LSP Rename')

setLSPKeyBind('a', function()
  vim.lsp.buf.code_action()
end, 'LSP Code Action')

setLSPKeyBind('d', function()
  vim.lsp.buf.definition()
end, 'LSP Go to Definition')

setLSPKeyBind('h', function()
  vim.lsp.buf.hover()
end, 'LSP Hover')

setLSPKeyBind('s', function()
  vim.lsp.buf.signature_help()
end, 'LSP Signature Help')
