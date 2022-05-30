-------------------------------------------------------------------------------
-- settings.lua
-------------------------------------------------------------------------------

vim.g.mapleader = " "

vim.cmd [[syntax on]]
vim.cmd [[filetype plugin indent on]]

local options = {
    autoread = true,
    background = "dark",
    bs={"indent","eol","start"},
    encoding="UTF-8",
    expandtab = true,
    history=50,
    incsearch = true,
    number = true,
    rnu = true,
    ignorecase = true,
    shiftwidth=4,
    scrolloff=8,
    smartcase = true,
    smartindent = true,
    softtabstop = 4,
    spelllang = "en_gb",
    splitbelow = true,
    splitright = true,
    tabstop = 4,
    undofile = true,
    wildignore = { "*.pyc","*.o","*.obj","*.svn","*.swp","*.class","*.hg","*.DS_Store","*.min.*"},
    mouse = "a",
    signcolumn = "number",
    undodir = "~/.dotfiles/nvim/undo",
    undofile = true,
    wrap = true,
    laststatus=2,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end