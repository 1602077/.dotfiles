-----------------------------------------------------------
-- settings.lua
-----------------------------------------------------------

vim.g.mapleader = " "

vim.cmd [[syntax on]]
vim.cmd [[filetype detect]]
vim.cmd [[filetype plugin indent on]]

vim.cmd [[highlight VertSplit cterm=NONE]]
vim.cmd [[highlight TabLineFill cterm=NONE]]
vim.cmd [[highlight TabLine cterm=NONE]]
vim.cmd [[highlight! link SignColumn LineNr]]


local options = {
    autoread = true,
    background = "dark",
    bs = {"indent","eol","start"},
    directory = os.getenv("HOME") .. "/.vim/tmp",
    encoding = "UTF-8",
    expandtab = true,
    history = 50,
    incsearch = true,
    number = true,
    rnu = true,
    ignorecase = true,
    shiftwidth = 4,
    scrolloff = 8,
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
    undodir = os.getenv("HOME") .. "/.vim/undo",
    undofile = true,
    wrap = true,
    laststatus = 3,
    -- fillchars = {vert=" ", foldopen = "▾", foldsep = "│", foldclose = "▸",},
    fillchars = { foldopen = "▾", foldsep = "│", foldclose = "▸" },
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

-- vim.cmd([[colorscheme slate]])
