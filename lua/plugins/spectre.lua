return {
	"nvim-pack/nvim-spectre",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>s", "<cmd>lua require('spectre').toggle()<cr>", "SearchPanel" },
	},
	config = function()
		require("spectre").setup({})
	end,
}
