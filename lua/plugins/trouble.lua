return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	config = function()
		vim.diagnostic.config({ virtual_text = { prefix = "●" } })

		local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		require("trouble").setup()
	end,
	keys = {
		{ "<leader>e", "<Cmd>TroubleToggle<CR>", desc = "Trouble" },
	},
}
