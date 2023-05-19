return {
    "folke/trouble.nvim",
    dependenices = {
        "nvim-tree/nvim-web-devicon",
    },
    config = function()
        require("trouble").setup()

        vim.keymap.set("n", "<leader>e", ":TroubleToggle<cr>")
    end,
}
