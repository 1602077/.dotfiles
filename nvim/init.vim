" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc (neovim branch)
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require("general")

" rm split bar colouring & chars
set fillchars+=vert:\   
highlight VertSplit cterm=NONE
highlight TabLineFill cterm=NONE
highlight TabLine ctermbg=NONE



" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua require("plugins")

" gruvbox
silent! colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE

" nerdtree
let g:NERDTreeMinimalUI=1
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1

" vim-gitgutter
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=70
highlight GitGutterChange guifg=#bbbb00 ctermfg=214
highlight GitGutterDelete guifg=#ff2222 ctermfg=52
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0

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


lua require("keymaps")
lua require("autocmd")
lua require("lsp")

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
