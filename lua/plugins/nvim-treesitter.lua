return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").prefer_git=true;
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "html", "javascript","bash" },
            sync_install = false,
            auto_install = true
        })
    end
}
