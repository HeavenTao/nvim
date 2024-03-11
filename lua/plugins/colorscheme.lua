return {
	--"folke/tokyonight.nvim",
	--config=function()
	--vim.cmd.colorscheme("tokyonight-night")
	--end
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
