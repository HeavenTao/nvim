return {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = true,
    config = function()
        --主題設置
        if vim.fn.has('termguicolors') ~= 0 then
            vim.o.termguicolors = true
        end
        vim.cmd.colorscheme('tokyonight-night')
        require('tokyonight').setup({
        })
    end
}
