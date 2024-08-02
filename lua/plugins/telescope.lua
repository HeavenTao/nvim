return {
  {
    "nvim-telescope/telescope.nvim",
    keys = function()
      return {
        { "<leader>f", "<Cmd>Telescope find_files<cr>", desc = "find_files" },
        { "<leader>fg", "<Cmd>Telescope live_grep<cr>", desc = "live_grep" },
        { "<leader>ft", "<Cmd>TodoTelescope<cr>", desc = "todo" },
        { "<leader>fk", "<Cmd>Telescope keymaps<cr>", desc = "keymaps" },
        { "<leader>fm", "<Cmd>Telescope marks<cr>", desc = "marks" },
        { "<leader>fr", "<Cmd>Telescope registers<cr>", desc = "registers" },
        { "<leader>fb", "<Cmd>Telescope buffers<cr>", desc = "buffers" },
      }
    end,
  },
}
