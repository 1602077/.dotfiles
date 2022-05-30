" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neovim config
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require("general")
lua require("plugins")
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
