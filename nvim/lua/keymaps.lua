-----------------------------------------------------------
-- keymaps.lua
-----------------------------------------------------------

local map = require("utils").map

-----------------------------------------------------------
-- Insert Mode
-----------------------------------------------------------

map('i', '[<CR>', '[<CR>]<Esc>O')
map('i', '{<CR>', '{<CR>}<Esc>O')
map('i', '{;<CR>', '{<CR>};<Esc>O')

-- inoremap {{      {}<Left>
-- inoremap ((      ()<Left>
-- inoremap [[      []<Left>

-- Plugin: Snippets
map('i', '<c-s>', '<Plug>luasnip-expand-or-jump')

-----------------------------------------------------------
-- Normal Mode
-----------------------------------------------------------

-- Window Management
map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>l', ':wincmd l<CR>')
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>sh', '<C-W>v<CR>:wincmd l<CR><leader>f', { noremap = false, silent = true })
map('n', '<leader>sv', ':sp<CR><leader>f', { noremap = false, silent = true })

-- File Management
map('n', '<leader>cd', ':lcd %:p:h<CR>')
map('n', '<leader>n', ':e %:h/', {noremap = true})
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':bd<CR>')

-- Miscellanous
map('n', 'Y', 'y$')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '<leader>cc', ':execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>')
-- map('n', '<leader>W', ':let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>')

-- Plugin: nerdtree
map('n', '<leader>F', ':NERDTreeToggle<CR>')

-- Plugin: telescope
map('n', '<leader>f', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>")
map('n', '<leader>rg', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map('n', '<leader>gb', "<cmd>lua require('telescope.builtin').git_branches()<CR>")


-- Plugin: vim-commentary
map('n', '<leader>/', ':Commentary<CR>')

-- Plugin: vim-fugitive
map('n', '<leader>gs', ':Git status<CR>')
map('n', '<leader>gc', ':Git commit -am "')
map('n', '<leader>gp', ':Git push origin ')
map('n', '<leader>gP', ':Git push origin main<CR>')
-- nnoremap <silent><expr><leader>f FugitiveHead() != '' ? ':GFiles<CR>' : ':Files<CR>'

-- Plugin: vim-gitgutter
map('n', ']g', ':GitGutterNextHunk<CR>')
map('n', '[g', ':GitGutterPrevHunk<CR>')
map('n', '<leader>gt', ':GitGutterToggle<CR>')

-- Plugin: dap (debugging)
map('n', '<F5>', ":lua require'dap'.continue()<CR>")
map('n', '<F8>', ":lua require'dap'.step_over()<CR>")
map('n', '<F7>', ":lua require'dap'.step_into()<CR>")
map('n', '<F9>', ":lua require'dap'.step_out()<CR>")

-- map('n', '<leader>dr', ":lua require'dap'.repl.open()<CR>")
map('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>")
map('n', '<leader>dc', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map('n', '<leader>dt', ":lua require'dap-go'.debug_test()<CR>")

map('n', '<leader>dO', ":lua require'dapui'.open()<CR>")
map('n', '<leader>dT', ":lua require'dapui'.toggle()<CR>")
map('n', '<leader>dC', ":lua require'dapui'.close()<CR>")

-- Toggle spellcheck
map('n', '<leader>ss', ':set spell!<CR>', { noremap = true, silent = true })

-- Source rc
map('n', '<leader><leader>s', ':source ~/.dotfiles/nvim/init.lua<CR>')

-----------------------------------------------------------
-- Visual Mode
-----------------------------------------------------------

map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')

-- Plugin: vim-commentary
map('v', '<leader>/', ':Commentary<CR>')

