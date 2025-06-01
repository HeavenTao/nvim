return {
  "gbprod/yanky.nvim",
  opts = {
    ring = { storage = "memory" },
    preserve_cursor_position = {
      enabled = true,
    },
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 100,
    },
  },
  config = function(_, opts)
    require("yanky").setup(opts)
    require("telescope").load_extension "yank_history"
  end,
  keys = {
    { "<leader>p", "<cmd>Telescope yank_history<cr>", mode = { "n", "x" }, desc = "Open Yank History" },
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
  },
}
