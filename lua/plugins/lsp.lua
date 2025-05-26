local lspCfgs = require('config.lsp')

return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        'lua_ls',
        'pylsp',
        'rust_analyzer'
      },
    },
    lazy = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    lazy = false,
    config = function()

      lspCfgs.lua_ls_cfg()
      lspCfgs.pyls_cfg()

      -- Enable Diagnostics
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  }
}
