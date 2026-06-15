return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "luadoc",
      "vim",
      "vimdoc",
      "query",
      "zig",
      "python",
      "markdown",
      "markdown_inline",
      "json",
      "html",
      "css",
      "javascript",
      "bash",
      "diff",
    },
  },
}
