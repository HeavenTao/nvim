return {
  "hedyhli/outline.nvim",
  config = function()
    require("outline").setup()
  end,
  keys = {
    { "<leader>o", "<Cmd>Outline<CR>", desc = "Toggle outline" },
  },
}
