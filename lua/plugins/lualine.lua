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
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress", "location" },
				lualine_z = {
					{
						function()
							return " " .. os.date("%R")
						end,
						color = { bg = "#9ece6a" },
					},
				},
			},
		})
	end,
}
