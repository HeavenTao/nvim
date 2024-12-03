return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      --t,T,f,F
      char = {
        enabled = false, --会影响dt等操作
      },
    },
    label = {
      rainbow = {
        enabled = true,
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },

      function()
        -- default options: exact mode, multi window, all directions, with a backdrop
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },

      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  },
}
