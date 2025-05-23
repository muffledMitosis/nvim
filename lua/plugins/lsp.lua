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
        'pylsp'
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
      --vim.lsp.enable('lua_ls')
      lspCfgs.lua_ls_cfg()
      lspCfgs.pyls_cfg()
    end,
  }
}
