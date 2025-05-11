return {
  "uga-rosa/translate.nvim",
  config = function()
    require("translate").setup {
      default = {
        command = "google",
        ouput = "floating",
      },
      replace_symbols = {
        google = {
          ["/"] = " ",
          ["-"] = " ",
        },
      },
    }
  end,
  keys = {
    {
      mode = { "n", "v" },
      "<leader>tt",
      "<cmd>Translate ZH<CR>",
    },
  },
}
