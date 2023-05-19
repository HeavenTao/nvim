vim.g.coc_global_extensions = { "coc-explorer" }
vim.g.coc_config_home = "~/.config/coc/"

return {
    "neoclide/coc.nvim",
    branch = "release",
    --enabled = false,
    config = function()
        vim.keymap.set("n", "<leader>n", ":CocCommand explorer<cr>")
    end,
}
