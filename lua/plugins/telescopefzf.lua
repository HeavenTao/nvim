return {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    build = "make",
    enabled = vim.fn.executable("make") == 1,
    config = function()
        require("telescope").load_extension("fzf")
    end,
}
