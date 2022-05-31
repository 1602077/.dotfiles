-----------------------------------------------------------
-- plugins.lua
-----------------------------------------------------------

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.dotfiles/nvim/autoload')

-- general
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

-- git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

-- go
Plug('fatih/vim-go', {['do'] = ':GoUpdateBinaries'})

-- python formatter
Plug 'psf/black'

-- telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- treesitter
Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

-- snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

-- debugging
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

vim.call('plug#end')
vim.call('plug#helptags')

-----------------------------------------------------------
-- Load plugin configs
-----------------------------------------------------------
require('plugins.configs.gruvbox')
require('plugins.configs.nerdtree')
require('plugins.configs.telescope')
require('plugins.configs.vim-gitgutter')
require('plugins.configs.vim-go')
require('plugins.configs.debug')
require('plugins.configs.snippets')
