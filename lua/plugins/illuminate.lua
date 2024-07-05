return {
	"RRethy/vim-illuminate",
	enabled = false, --暂时不需要该功能
	opts = {
		delay = 200,
		large_file_cutoff = 2000,
		large_file_overrides = {
			providers = { "lsp" },
		},
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
