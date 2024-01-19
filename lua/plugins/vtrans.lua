return {
	dir = "~/code/v-trans/",
	lazy = false,
	config = function() end,
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
