return {
	"chrisgrieser/nvim-spider",
	enabled = false,
	keys = {
		{ "e", "<cmd>lua require('spider').motion('e')<cr>", mode = { "n", "o", "x" } },
		{ "w", "<cmd>lua require('spider').motion('w')<cr>", mode = { "n", "o", "x" } },
		{ "b", "<cmd>lua require('spider').motion('b')<cr>", mode = { "n", "o", "x" } },
	},
}
