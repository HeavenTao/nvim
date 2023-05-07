--网络环境不好时，取消注释
--require('packer').init({
--git = {
--clone_timeout = 1200
--}
--})
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'neoclide/coc.nvim', branch = 'release' }
    --use 'sainnhe/everforest'
    use 'folke/tokyonight.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'nvim-tree/nvim-web-devicons'
    --Toggleterm
    use 'akinsho/toggleterm.nvim'
    --lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    use 'preservim/nerdcommenter'
    use '/usr/local/src/v-trans/'
    use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }
    use 'mhinz/vim-startify'
end)
