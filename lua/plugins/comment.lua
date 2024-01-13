return {
    "preservim/nerdcommenter",
    config = function()
        vim.g.NERDCreateDefaultMappings = 0
    end,
    keys = {
        { "<leader>cc", mode = { "n", "v" }, "<Plug>NERDCommenterInvert", desc = "Commenter" }
    }
}
