-------------------------------------------------------------------------------
-- plugins.lua
-------------------------------------------------------------------------------

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

-- python
Plug('psf/black', {branch = 'stable'})

-- telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

vim.call('plug#end')
vim.call('plug#helptags')

-- TODO: Figure out how to do auto install of vim-plug & plugins

-- auto install vim-plug and plugins:
-- let plug_install = 0
-- let autoload_plug_path = '~/.dotfiles/nvim' . '/autoload/plug.vim'
-- if !filereadable(autoload_plug_path)
--     execute '!curl -fL --create-dirs -o ' . autoload_plug_path .
--         \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
--     execute 'source ' . fnameescape(autoload_plug_path)
--     let plug_install = 1
-- endif
-- unlet autoload_plug_path

-- auto install vim-plug and plugins:
-- if plug_install
--     PlugInstall --sync
-- endif
-- unlet plug_install
