return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("trouble").setup()
	end,
	keys = {
		{ "<leader>e", "<Cmd>TroubleToggle<CR>", desc = "Trouble" },
	},
}
