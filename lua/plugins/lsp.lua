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
        'lua_ls'
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
      vim.lsp.enable('lua_ls')
    end,
  }
}
