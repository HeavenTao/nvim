return {
  "stevearc/overseer.nvim",
  opts = {},
  lazy = false,
  config = function()
    require("overseer").setup()
  end,
  keys = {
    {
      "<leader>tr",
      mode = { "n" },
      "<cmd>OverseerRun<cr>",
    },
    {
      "<leader>to",
      mode = { "n" },
      "<cmd>OverseerToggle<cr>",
    },
  },
}
