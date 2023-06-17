return {
    "ggandor/flit.nvim",
    dependencies = {
        { "ggandor/leap.nvim" },
        { "tpope/vim-repeat" }
    },
    config = function()
        require("leap").add_default_mappings()
        require("flit").setup({})
    end
}
