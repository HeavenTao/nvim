return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
        vim.opt.list = true
        vim.opt.listchars:append "eol:↴"
        vim.g.indent_blankline_filetype_exclude = { "lspInfo", "packer", "checkhealth", "help", "man", "dashboard", "", }
        require("indent_blankline").setup({
            show_current_context = true,
            show_current_context_start = true
        })
    end
}
