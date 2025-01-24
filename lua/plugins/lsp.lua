return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {}
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua_ls",
        "bashls",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lconf = require("lspconfig")

      lconf.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {version = "LuaJIT"}
          }
        }
      })

      lconf.bashls.setup({})
    end
  }
}
