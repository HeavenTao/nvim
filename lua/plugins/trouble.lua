return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>e",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics",
    },
  },
  config = function()
    require("trouble").setup()
  end,
}
