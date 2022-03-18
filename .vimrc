" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

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
" Insert mode remaps
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap ''      ''<Left>
" inoremap ""      ""<Left>
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
nmap <silent><leader>sv <C-W>v<CR>:wincmd l<CR><leader>f
nmap <silent><leader>sh :sp<CR><leader>f
nnoremap <silent><leader>, :w<CR>:bprev<CR>
nnoremap <silent><leader>. :w<CR>:bnext<CR>
nnoremap <silent><leader>cd :lcd %:p:h<CR>
nnoremap <silent><leader>q :bd<CR>
nnoremap <silent><leader>B :Buffers<CR>

nnoremap <silent>l. :lnext<CR>
nnoremap <silent>l, :lprev<CR>

" error jumping
nnoremap <silent><leader>e :lne<CR>
nnoremap <silent><leader>E :lprevious<CR>

" miscellanous
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>n :e %:h/
nnoremap <leader>w :w<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" clear white space & toggle colour column
nnoremap <silent><leader>W :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <leader>cc :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>

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
Plug 'psf/black', { 'branch': 'stable' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
call plug#end()

" installs tpope's surrond & commentary
execute pathogen#infect()

" gruvbox
colorscheme gruvbox
highlight Normal ctermbg=NONE

" nerdtree
let g:NERDTreeMinimalUI=1
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
nnoremap <silent><leader>F :NERDTreeToggle<CR>

" vim-airline
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:ariline#extensions#tabline#buffer_idx_mode=1
let g:airline_detect_spelllang=0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_alt_sep=''
let g:airline_section_x = '' " tagbar/filetype/venc
let g:airline_section_y = '' " file encoding
let g:airline_section_z = '' " %, line #, col#
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nnoremap <leader>A :AirlineToggle<CR>

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
nnoremap <expr><leader>f fugitive#head() != '' ? ':GFiles<CR>' : ':Files<CR>'

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

" vim-snippets
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

let g:snips_author="jcmunday"

" you complete me
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_always_populate_location_list = 0
nnoremap <silent><leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

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
    autocmd BufWritePre *.py execute ':Black'

    autocmd FileType go nnoremap <leader>b :w<CR>:!go build .<CR>
    autocmd FileType go nnoremap <leader>r :w<CR>:GoRun<CR>
    autocmd FileType go nnoremap <leader>t :w<CR>:GoTest<CR>
    autocmd FileType go nnoremap <leader>tt :w<CR>:!go test ./...<CR>
    autocmd FileType go nnoremap <leader>tv :w<CR>:!go test -v<CR>
    autocmd FileType go nnoremap <leader>td :vimgrep /TODO/g **/*.go<CR>
    autocmd FileType go nnoremap <leader>R :GoReferrers<CR>
augroup END
