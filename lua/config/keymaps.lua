local M = {}

local lsp_keys = {
  { "<leader>cl", "<cmd>LspInfo<cr>",                                 desc = "Lsp Info" },
  { "gd",         vim.lsp.buf.definition,                             desc = "Goto Definition",            has = "definition" },
  { "gr",         vim.lsp.buf.references,                             desc = "References",                 nowait = true },
  { "gI",         vim.lsp.buf.implementation,                         desc = "Goto Implementation" },
  { "gy",         vim.lsp.buf.type_definition,                        desc = "Goto T[y]pe Definition" },
  { "gD",         vim.lsp.buf.declaration,                            desc = "Goto Declaration" },
  { "K",          function() return vim.lsp.buf.hover() end,          desc = "Hover" },
  { "gK",         function() return vim.lsp.buf.signature_help() end, desc = "Signature Help",             has = "signatureHelp" },
  { "<c-k>",      function() return vim.lsp.buf.signature_help() end, mode = "i",                          desc = "Signature Help", has = "signatureHelp" },
  { "<leader>ca", vim.lsp.buf.code_action,                            desc = "Code Action",                mode = { "n", "v" },     has = "codeAction" },
  { "<leader>cc", vim.lsp.codelens.run,                               desc = "Run Codelens",               mode = { "n", "v" },     has = "codeLens" },
  { "<leader>cC", vim.lsp.codelens.refresh,                           desc = "Refresh & Display Codelens", mode = { "n" },          has = "codeLens" },
  { "<leader>cR", function() Snacks.rename.rename_file() end,         desc = "Rename File",                mode = { "n" },          has = { "workspace/didRenameFiles", "workspace/willRenameFiles" } },
  { "<leader>cr", vim.lsp.buf.rename,                                 desc = "Rename",                     has = "rename" },
}

M.lsp_on_attach = function(_, bufnr)
  for _, map in ipairs(lsp_keys) do
    local mode = "n" -- Normal mode by default
    local opts = { noremap = true, silent = true, buffer = bufnr, desc = map.desc }

    -- Check if `map[3]` contains special keys like `desc` or `has`
    if map.nowait then opts.nowait = true end
    if map.has then
      -- Ensure the server supports this capability before mapping
      if not vim.lsp.get_active_clients({ bufnr = bufnr })[1].server_capabilities[map.has] then
        goto continue
      end
    end

    -- Set the keymap
    vim.keymap.set(mode, map[1], map[2], opts)
    ::continue::
  end
end

--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
--vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Actions' })
vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Format file' })

return M
