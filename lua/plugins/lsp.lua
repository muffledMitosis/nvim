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
        "tailwindcss",
        "texlab",
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

      lconf.bashls.setup({ on_attach = keymaps.lsp_on_attach })
      lconf.ts_ls.setup({ on_attach = keymaps.lsp_on_attach })
      lconf.html.setup({ on_attach = keymaps.lsp_on_attach })
      lconf.cssls.setup({ on_attach = keymaps.lsp_on_attach })
      lconf.clangd.setup({ on_attach = keymaps.lsp_on_attach })
      lconf.tailwindcss.setup({ on_attach = keymaps.lsp_on_attach })
      lconf.texlab.setup({ on_attach = keymaps.lsp_on_attach })
    end
  }
}
