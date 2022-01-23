" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
" colorscheme slate

set autoread
set background=dark
set bs=indent,eol,start
set directory^=$HOME/.vim/tmp/
set encoding=UTF-8
set expandtab
set history=50
set incsearch
set mouse=a
set number
set rnu
set noerrorbells
set ignorecase
set shiftwidth=4
set scrolloff=8
set smartcase
set smartindent
set softtabstop=4
set spelllang=en_gb
set splitbelow
set tabstop=4
set termwinsize=15x0
set undodir=~/.vim/undodir
set undofile
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
set wrap

" rm split bar colouring & chars
set fillchars+=vert:\   
highlight VertSplit cterm=NONE
highlight TabLineFill cterm=NONE
highlight TabLine ctermbg=NONE

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File detection
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup file_detections
    autocmd!
    autocmd FileType text setlocal spell

    autocmd FileType tex setlocal spell
    autocmd FileType tex nnoremap <leader>r :w<CR>:!pdflatex %<CR><CR>

    autocmd FileType markdown setlocal spell

    autocmd FileType python nnoremap <leader>r :w<CR>:!python3 %<CR>

    autocmd FileType go nnoremap <leader>r :w<CR>:GoRun<CR>
    autocmd FileType go nnoremap <leader>t :w<CR>:GoTest<CR>
    autocmd FileType go nnoremap <leader>tv :w<CR>:!go test -v<CR>
    autocmd FileType go nnoremap <leader>tb :w<CR>:!go test -bench=.<CR>

    " comment remaps:  now using vim-commentary instead
    "autocmd FileType python nnoremap <leader>c I# <Esc>
    "autocmd FileType python nnoremap <leader>u ^2x<Esc>
    "autocmd FileType tex nnoremap <leader>c I% <Esc>
    "autocmd FileType tex nnoremap <leader>u ^2x<Esc>
    "autocmd FileType go nnoremap <leader>c I// <Esc>
    "autocmd FileType go nnoremap <leader>u ^3x<Esc>
augroup END

au! BufWritePost $MYVIMRC source %
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert mode remaps
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap ''      ''<Left>
inoremap ""      ""<Left>
inoremap {{      {}<Left>
inoremap ((      ()<Left>
inoremap [[      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap (<CR>  (<CR>)<Esc>O
inoremap {<CR>  {<CR>}<Esc>O
inoremap {;<CR>  {<CR>};<Esc>O

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal mode remaps
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" window management
nnoremap <silent><leader>T :term<CR>
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>sv <C-W>v<CR>:wincmd l<CR>:Files<CR>
nnoremap <silent><leader>sh :sp<CR>:Files<CR>

" buffer movement & cd to wd of open buff
nnoremap <silent><leader>, :w<CR>:bprev<CR>
nnoremap <silent><leader>. :w<CR>:bnext<CR>
nnoremap <silent><leader>cd :lcd %:p:h<CR>
nnoremap <silent><leader>q :bd<CR>

" error jumping
nnoremap <silent><leader>e :lne<CR>
nnoremap <silent><leader>E :lprevious<CR>

" miscellanous
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>n :e %:h/
nnoremap <leader>w :w<CR>
nnoremap <silent><leader>W :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin install, config & remappings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" gruvbox
colorscheme gruvbox
highlight Normal ctermbg=NONE

" installs tpope's surrond & commentary
execute pathogen#infect()

" nerdtree
let g:NERDTreeMinimalUI=1
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeShowHidden=1
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeQuitOnOpen=1
nnoremap <silent><leader>F :NERDTreeToggle<CR>

" vim-airline
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" vim-commentary
nnoremap <silent><leader>/ :Commentary<CR>
vnoremap <silent><leader>/ :Commentary<CR>

" vim-fugitive
nnoremap <leader>g :Git 
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit -am "
nnoremap <leader>gp :Git push origin
nnoremap <leader>gP :Git push origin main<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <expr> <leader>f fugitive#head() != '' ? ':GFiles<CR>' : ':Files<CR>'

" vim-gitgutter
set signcolumn=number
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=70
highlight GitGutterChange guifg=#bbbb00 ctermfg=214
highlight GitGutterDelete guifg=#ff2222 ctermfg=52
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0
nnoremap ]g :GitGutterNextHunk<CR>
nnoremap [g :GitGutterPrevHunk<CR>
nnoremap <leader>gt :GitGutterToggle<CR>

" vim-go
let g:go_fmt_command = "goimports"
let g:go_template_autocreate = 0

" you complete me
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_always_populate_location_list = 0
nnoremap <silent><leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
