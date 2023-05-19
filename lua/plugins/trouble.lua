return {
    "folke/trouble.nvim",
    dependenices = {
        "nvim-tree/nvim-web-devicon",
    },
    config = function()
        require("trouble").setup()

        vim.keymap.set("n", "<leader>e", ":TroubleToggle<cr>")

        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
    end,
}
