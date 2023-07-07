return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.1",
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    --lazy = false,
    config = function()
    end,
    keys = {
        { "<leader>f",  "<Cmd>Telescope find_files<cr>", desc = "find_files" },
        { "<leader>fg", "<Cmd>Telescope live_grep<cr>",  desc = "live_grep" },
        { "<leader>ft", "<Cmd>TodoTelescope<cr>",        desc = "todo" },
        { "<leader>fk", "<Cmd>Telescope keymaps<cr>",    desc = "keymaps" },
    }

}
