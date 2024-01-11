return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = { "<space>m", "<space>j", "<spance>s" },
    config = function()
        require("treesj").setup({})
    end
}
