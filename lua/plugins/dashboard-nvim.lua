return {
    "glepnir/dashboard-nvim",
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            shortcut_type = "number", --  shorcut type 'letter' or 'number'
            config = {
                week_header = {
                    enable = true,
                    concat = " Welcome HeavenTao!"
                },
                --shortcut = {
                --{
                --desc = " Tree",
                --group = 'string',
                --icon = ""
                --},
                --},
                project = {
                    enable = false,
                    limit = 8,
                    icon = 'your icon',
                    label = '',
                    action = 'Telescope find_files cwd='
                },
                mru = { enable = false, limit = 10, icon = '', label = '', },
            }
        }
    end
}
