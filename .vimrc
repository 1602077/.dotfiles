syntax on
colorscheme slate
set autoread
set background=dark
set bs=indent,eol,start
set expandtab
set history=50
set incsearch
set mouse=a
set number
set rnu
set shiftwidth=4
set smartcase
set smartindent
set softtabstop=4
set spelllang=en_gb
set splitbelow
set tabstop=4
set termwinsize=15x0
set wrap

" Plugin Installs
"execute pathogen#infect()

call plug#begin('~/.vim/plugged')

"Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Plugin Specific Settings
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1
let g:webdevicons_enable_nerdtree = 1
set encoding=UTF-8

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:ycm_autoclose_preview_window_after_completion=1

set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*

" Insert Mode Remaps
"inoremap [[      [<Left>
"inoremap ((      (<Left>
inoremap ''      ''<Left>
inoremap ""      ""<Left>
inoremap {{      {}<Left>
inoremap ((      ()<Left>
inoremap [[      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap (<CR>  (<CR>)<Esc>O
inoremap {<CR>  {<CR>}<Esc>O
inoremap {;<CR>  {<CR>};<Esc>O

" Normal Mode Remaps
let mapleader = " "
" Windows-manager remaps
nnoremap <silent><leader>t :term<CR>
nnoremap <silent><leader>F :NERDTreeToggle<CR>
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>f :Files<CR>
nnoremap <silent><leader>vs <C-W>v<CR>:wincmd l<CR>:Files<CR>

nnoremap <silent><leader>, :w<CR>:bprev<CR>
nnoremap <silent><leader>. :w<CR>:bnext<CR>

" Git remaps using vim-fugitive
nnoremap <leader>g :Git 
nnoremap <silent> <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit -am ""<Left>
nnoremap <leader>gp :Git push origin

" Misc. remaps
nnoremap <leader>n :e %:h/
nnoremap <silent> <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <silent> <leader>w :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" adjuting split bars
set fillchars+=vert:\   
highlight VertSplit cterm=NONE
highlight TabLineFill cterm=NONE
highlight TabLine ctermbg=NONE

" save vim swaps in external dir to wd
set directory^=$HOME/.vim/tmp//

" autcmds
augroup file_detections
    autocmd!
    autocmd FileType text setlocal spell
    autocmd FileType tex setlocal spell
    autocmd FileType tex nnoremap <leader>r :w<CR>:!pdflatex %<CR><CR>
    autocmd FileType tex nnoremap <leader>c I% <Esc> 
    autocmd FileType tex nnoremap <leader>u ^2x <Esc> 
    autocmd FileType markdown setlocal spell

    autocmd FileType python nnoremap <leader>c I# <Esc> 
    autocmd FileType python nnoremap <leader>u ^2x <Esc> 
    autocmd FileType python nnoremap <leader>r :w<CR>:!python3 %<CR><CR>
augroup END
