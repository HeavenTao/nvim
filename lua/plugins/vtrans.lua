return {
	dir = "~/code/v-trans/",
	config = function() end,
	keys = {
		{
			"<leader>t",
			function()
				require("v-trans").sayhello()
			end,
			"VTransTest",
		},
	},
}
