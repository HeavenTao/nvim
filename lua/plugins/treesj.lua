return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = { "<space>m" },
  config = function()
    require("treesj").setup {
      max_join_length = 1200,
    }
  end,
}
