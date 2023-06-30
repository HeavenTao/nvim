vim.g.NERDCreateDefaultMappings = 0

return {
    "preservim/nerdcommenter",
    keys = {
        { "<leader>cc", mode = { "n", "v" }, "<Plug>NERDCommenterInvert", desc = "Commenter" }
    }
}
