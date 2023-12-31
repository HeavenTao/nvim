return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true
        require("nvim-tree").setup({
            view = {
                side = "right",
            },
            renderer = {
                icons = {
                    glyphs = {
                        git = {
                            unstaged = "",
                            renamed = ""
                        }
                    }
                }
            }
        })
    end,
    keys = {
        { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" }
    }
}
