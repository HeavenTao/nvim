return {
    "folke/trouble.nvim",
    dependencies={
        "nvim-tree/nvim-web-devicons"
    },
    config=function()
        require("trouble").setup()

        vim.keymap.set("n","<leader>e",":TroubleToggle<CR>",{noremap=true,silent=true})
    end
}
