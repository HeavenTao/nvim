return {
  "askfiy/smart-translate.nvim",
  cmd = { "Translate" },
  dependencies = {
    "askfiy/http.nvim", -- a wrapper implementation of the Python aiohttp library that uses CURL to send requests.
  },
  config = function()
    require("smart-translate").setup()
  end,
  keys = {
    {
      "<leader>tt",
      mode = { "n", "v" },
      "<cmd>Translate --source=en --target=zh-CN --engine=google --handle=float <cr>",
      desc = "Translate",
    },
  },
}
