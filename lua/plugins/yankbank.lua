return {
	"ptdewey/yankbank-nvim",
	config = function()
		require("yankbank").setup()
	end,
	keys = {
		{ "<leader>y", "<Cmd>YankBank<CR>", desc = "YankBank" },
	},
}
