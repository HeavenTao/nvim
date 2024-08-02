return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = function()
      return {
        {
          "<leader>n",
          "<cmd>Neotree source=filesystem position=right toggle=true reveal=true<cr>",
          desc = "Neotree",
        },
      }
    end,
  },
}
