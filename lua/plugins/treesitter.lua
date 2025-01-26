return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
--  build = ":TSUpdate",
  prioriy = 1000,
  opts = {
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "lua",
      "html",
      "javascript",
      "tsx",
      "typescript",
      "vim",
      "xml",
      "yaml",
      "cpp",
      "c",
    }
  }
}
