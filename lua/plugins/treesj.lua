return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = { "<space>m", "<space>j", "<spance>s" },
    config = function()
        require("treesj").setup({
            max_join_length = 1200
        })
    end
}
