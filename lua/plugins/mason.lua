return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
	},
	cmd = "Mason",
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"tsserver",
				"bashls",
				"rust_analyzer",
			},
		})
	end,
}
