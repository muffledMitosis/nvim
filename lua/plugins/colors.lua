return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
--      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1001,
    opts = {},
    config = function()
--      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  {
    "shaunsingh/moonlight.nvim",
    lazy = false,
    priority = 1002,
    opts = {},
    config = function()
      vim.cmd([[colorscheme moonlight]])
    end,

  }
}
