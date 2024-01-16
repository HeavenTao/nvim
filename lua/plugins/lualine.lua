return {
	"nvim-lualine/lualine.nvim",
	--lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = {
					"branch",
					{
						"diff",
						diff_color = {
							added = { fg = "#9ece6a" },
							modified = { fg = "#7aa2f7" },
							removed = { fg = "#f7768e" },
						},
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
					},
					"diagnostics",
				},
				lualine_c = { { "filename", icon = "" } },
				lualine_x = {
					{
						"encoding",
					},
					{
						"filetype",
					},
				},
				lualine_y = {
					{
						"progress",
						icon = "󰠞",
						color = {
							bg = "#f38ba8",
							fg = "#1e1e2e",
						},
					},
					{
						"location",
						icon = "",
						color = {
							bg = "#89b4fa",
							fg = "#1e1e2e",
						},
					},
				},
				lualine_z = {
					{
						function()
							return os.date("%R")
						end,
						color = {
							bg = "#9ece6a",
						},
						icon = " ",
					},
				},
			},
			extensions = { "lazy", "mason", "neo-tree", "symbols-outline", "toggleterm", "trouble" },
		})
	end,
}
