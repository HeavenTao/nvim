return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    config = function()
        vim.opt.list = false
        require("ibl").setup({
            exclude = {
                filetypes = { "dashboard" }
            }
        })
    end,
}
