return {
	"chrisgrieser/nvim-spider",
	config = function()
		require("spider").setup({
			skipInsignificantPunctuation = false,
		})
	end,
	keys = {
		{ "e", "<cmd>lua require('spider').motion('e')<cr>", mode = { "n", "o", "x" } },
		{ "w", "<cmd>lua require('spider').motion('w')<cr>", mode = { "n", "o", "x" } },
		{ "b", "<cmd>lua require('spider').motion('b')<cr>", mode = { "n", "o", "x" } },
	},
}
