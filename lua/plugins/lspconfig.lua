return {
    "neovim/nvim-lspconfig",
    config=function()
        require("lspconfig").pyright.setup{
            root_dir=function()
                return vim.fs.dirname(vim.fs.find({'main.py', '.git','.venv'}, { upward = true })[1])
            end
        }
    end
}
