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
set nocompatible
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
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nmap <silent><leader>sv <C-W>v<CR>:wincmd l<CR><leader>f
nmap <silent><leader>sh :sp<CR><leader>f
nnoremap <silent><leader>cd :lcd %:p:h<CR>
nnoremap <silent><leader>q :bd<CR>
nnoremap <silent><leader>B :Buffers<CR>

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
" Status line
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

let g:git_branch = ''

function! GitBranch()
    let g:git_branch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! FormatGitBranch()
    return strlen(g:git_branch) > 0?'   '.g:git_branch.' ':''
endfunction

function! TrailingWhiteSpace()
    if !exists("b:trailing_space_warning")
        if !&modifiable
            let b:trailing_space_warning = ''
            return b:trailing_space_warning
        endif
        if search('\s\+$', 'nw') != 0
            let b:trailing_space_warning = ' trailing-whitespace'
        else
            let b:trailing_space_warning = ''
        endif
    endif
    return b:trailing_space_warning
endfunction

function! TabWarning()
    if !exists("b:statusline_tab_warning")
        let b:tab_warning = ''
        if !&modifiable
            return b:tab_warning
        endif
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
        if tabs && spaces
            let b:tab_warning =  ' mixed-indent'
        endif
    endif
    return b:tab_warning
endfunction

" runs statusline functions in an auto-command group
aug statusline()
    autocmd!
    autocmd BufRead * call GitBranch()
    autocmd cursorhold,bufwritepost * unlet! b:trailing_space_warning
    autocmd cursorhold,bufwritepost * unlet! b:tab_warning
aug END

" statusline config
set statusline=
set statusline+=%#GruvboxGreen#         " change colour scheme
set statusline+=%{FormatGitBranch()}    " get git branch on buf read
set statusline+=%#LineNr#               " change colour scheme
set statusline+=\ %f                    " filename
set statusline+=%m                      " modified?
set statusline+=%=                      " switch to rhs
set statusline+=%#GruvboxOrangeBold#    " change colour scheme
set statusline+=%{TabWarning()}         " check for mixed indent file
set statusline+=%{TrailingWhiteSpace()} " check for trailing whitespace
set statusline+=%#LineNr#               " change colour scheme
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%p%%\]               " % position in file

" help: list highlight groups with: `:so $VIMRUNTIME/syntax/hitest.vim`

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin install, config & remappings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
call plug#end()

" gruvbox
silent! colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE

" fzf
set rtp+=/opt/homebrew/opt/fzf
let g:fzf_layout = { 'window': 'split' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" nerdtree
let g:NERDTreeMinimalUI=1
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1
nnoremap <silent><leader>F :NERDTreeToggle<CR>

" vim-commentary
nnoremap <silent><leader>/ :Commentary<CR>
vnoremap <silent><leader>/ :Commentary<CR>

" vim-fugitive
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gc :Git commit -am "
nnoremap <leader>gp :Git push origin
nnoremap <leader>gP :Git push origin main<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <silent><expr><leader>f FugitiveHead() != '' ? ':GFiles<CR>' : ':Files<CR>'

" vim-go
let g:go_fmt_command = "goimports"
let g:go_template_autocreate = 0
let g:go_auto_type_info = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1


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

    autocmd FileType go nnoremap <leader>b :w<CR>:!go build .<CR>
    autocmd FileType go nnoremap <leader>r :w<CR>:GoRun<CR>
    autocmd FileType go nnoremap <leader>t :w<CR>:GoTest<CR>
    autocmd FileType go nnoremap <leader>tt :w<CR>:!go test ./...<CR>
    autocmd FileType go nnoremap <leader>tv :w<CR>:!go test -v<CR>
    autocmd FileType go nnoremap <leader>td :vimgrep /TODO/g **/*.go<CR>
    autocmd FileType go nnoremap <leader>R :GoReferrers<CR>
augroup END
