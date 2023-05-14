return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
        require('lualine').setup {
            options = {
                section_separators = { left = '', right = '' },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                }
            }
        }
    end
}
