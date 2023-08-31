return {
    "simrat39/symbols-outline.nvim",
    config = function()
        require("symbols-outline").setup()
    end,
    cmd = "SymbolsOutline",
    keys = {
        { "<leader>s", "<Cmd>SymbolsOutline<cr>", desc = "SymbolsOutline" },
    }
}
