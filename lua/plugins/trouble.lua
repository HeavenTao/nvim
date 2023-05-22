return {
    "folke/trouble.nvim",
    dependencies={
        "nvim-tree/nvim-web-devicons"
    },
    config=function()
        require("trouble").setup()

        vim.keymap.set("n","<leader>e",":TroubleToggle<CR>",{noremap=true,silent=true})
        local signs={Error = " ", Warn = " ", Hint = " ", Info = " "}
        for type,icon in pairs(signs) do
            local hl ="DiagnosticSign"..type
            vim.fn.sign_define(hl,{text=icon,texthl=hl,numhl=""})
        end
    end
}
