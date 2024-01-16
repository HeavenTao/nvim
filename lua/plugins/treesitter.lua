return {
	"nvim-treesitter/nvim-treesitter",
	enabled = true,
	build = ":TSUpdate",
	config = function()
		local parserPath = vim.fn.stdpath("data") .. "/treesitter"
		vim.opt.rtp:append(parserPath)
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup({
			parser_install_dir = parserPath,
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"html",
				"javascript",
				"bash",
				"markdown",
				"markdown_inline",
				"regex",
			},
			sync_install = false,
			auto_install = true,
		})
	end,
}
