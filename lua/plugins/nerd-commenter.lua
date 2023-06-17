vim.g.NERDCreateDefaultMappings=0

return {
    "preservim/nerdcommenter",
    keys = {
        { "<leader>cc", "<Plug>NERDCommenterInvert",desc="Commenter" }
    }
}
