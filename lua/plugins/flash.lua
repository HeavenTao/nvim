return {
    "folke/flash.nvim",
    config = function()
    end,
    event = "VeryLazy",
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
        --{
        --"r",
        --mode = "o",
        --function()
        --require("flash").remote()
        --end,
        --desc = "Remote Flash",
        --},
        --{
        --"R",
        --mode = { "o", "x" },
        --function()
        --require("flash").treesitter_search()
        --end,
        --desc = "Treesitter Search"
        --}
    },
}
