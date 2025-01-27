local keymaps = require("config.keymaps")

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
        "ts_ls",
        "html",
        "cssls",
        "clangd",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lconf = require("lspconfig")
      lconf.lua_ls.setup({
        on_attach = keymaps.lsp_on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              library = {
                vim.env.VIMRUNTIME
              }
            }
          }
        }
      })

      lconf.bashls.setup({
        on_attach = keymaps.lsp_on_attach,
      })
    end
  }
}
