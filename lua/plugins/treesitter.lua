return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    highlight = { enable = true },
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
