return {
    "ggandor/flit.nvim",
    dependencies = {
        { "ggandor/leap.nvim" },
        { "tpope/vim-repeat" }
    },
    config = function()
        require("leap").add_default_mappings(true)
        require("flit").setup({})
    end
}
