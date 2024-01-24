return {
	dir = "~/code/v-trans/",
	lazy = false,
	enabled = true,
	config = function()
		require("v-trans").setup()
	end,
	keys = {
		{
			"<leader>t",
			function()
				require("v-trans").translate()
			end,
			"VTransTest",
		},
	},
}
