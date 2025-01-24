local vim = vim
local Plug = vim.fn['plug#']

-- Initialize plugin manager
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Plugins with additional options
Plug('Tsuzat/NeoSolarized.nvim', {
    ['branch'] = 'master'
}) -- Using a specific branch
Plug('https://github.com/junegunn/vim-easy-align.git') -- Any valid git URL
Plug('fatih/vim-go', {
    ['tag'] = '*',
    ['do'] = ':GoUpdateBinaries'
}) -- Using a tagged release
Plug('neoclide/coc.nvim', {
    ['branch'] = 'release'
}) -- Using a non-default branch
Plug('junegunn/fzf', {
    ['dir'] = '~/.fzf'
}) -- Install in a non-default directory
Plug('junegunn/fzf', {
    ['dir'] = '~/.fzf',
    ['do'] = './install --all'
}) -- Post-update hook: shell command
Plug('junegunn/fzf', {
    ['do'] = function()
        vim.fn['fzf#install']()
    end
}) -- Post-update hook: lambda
Plug('nsf/gocode', {
    ['rtp'] = 'vim'
}) -- Specify subdirectory for the plugin
Plug('preservim/nerdtree', {
    ['on'] = 'NERDTreeToggle'
}) -- On-demand loading: command
Plug('nvim-lua/plenary.nvim') -- Dependency for other plugins
Plug('nvim-telescope/telescope.nvim', {
    ['branch'] = '0.1.x'
}) -- Using a specific branch
Plug('tpope/vim-fireplace', {
    ['for'] = 'clojure'
}) -- On-demand loading: file type
-- Plug('~/.config/nvim/plugin') -- Unmanaged plugin (manually installed)

-- Additional plugins
Plug('folke/which-key.nvim')
Plug('echasnovski/mini.nvim', {
    branch = 'stable'
})
Plug('tjdevries/colorbuddy.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-treesitter/nvim-treesitter')
Plug('nvim-tree/nvim-web-devicons')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('akinsho/bufferline.nvim', {
    tag = '*'
})
Plug('scrooloose/nerdcommenter')
Plug('sheerun/vim-polyglot')
Plug('jiangmiao/auto-pairs')
Plug('tpope/vim-fugitive')

-- Language Support
Plug('neovim/nvim-lspconfig') -- Required for LSP
Plug('williamboman/mason.nvim') -- Optional
Plug('williamboman/mason-lspconfig.nvim') -- Optional

-- Indentation
Plug('lukas-reineke/indent-blankline.nvim')

-- Autocompletion
Plug('hrsh7th/nvim-cmp') -- Required
Plug('hrsh7th/cmp-nvim-lsp') -- Required
Plug('hrsh7th/cmp-buffer') -- Optional
Plug('hrsh7th/cmp-path') -- Optional
Plug('saadparwaiz1/cmp_luasnip') -- Optional
Plug('hrsh7th/cmp-nvim-lua') -- Optional
Plug('windwp/nvim-autopairs')

-- Snippets
Plug('L3MON4D3/LuaSnip') -- Required
Plug('rafamadriz/friendly-snippets') -- Optional

Plug('akinsho/toggleterm.nvim', {
    ['tag'] = '*'
})

-- Finalize plugin setup
vim.call('plug#end')

-- Load modules after plug#end()
require('options-config')
require('nerdtree-config')
require('telescope-config')
require('bufferline-config')
require('lualine-config')
require('which-key-config')
require('treesitter-config')
require('lsp-config')
require('autopairs-config')
require('indent-blankline-config')
require('terminal-config')
