return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "VeryLazy" },
	opts = {
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
		ensure_installed = { "lua", "javascript", "typescript" },
		sync_install = true,
		auto_install = true,
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = nil,
				node_incremental = nil,
				scope_incremental = nil,
				node_decremental = nil,
			},
		},
	},
}
