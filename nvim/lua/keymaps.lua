-----------------------------------------------------------
-- keymaps.lua
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Insert Mode
-----------------------------------------------------------

map('i', '[<CR>', '[<CR>]<Esc>0')
map('i', '{<CR>', '{<CR>}<Esc>0')
map('i', '{;<CR>', '{<CR>};<Esc>0')

-- inoremap {{      {}<Left>
-- inoremap ((      ()<Left>
-- inoremap [[      []<Left>

-----------------------------------------------------------
-- Normal Mode
-----------------------------------------------------------

-- Window Management
map('n', '<leader>h', ':wincmd h<CR>')
map('n', '<leader>l', ':wincmd l<CR>')
map('n', '<leader>j', ':wincmd j<CR>')
map('n', '<leader>k', ':wincmd k<CR>')
map('n', '<leader>sv', '<C-W>v<CR>:wincmd l<CR><leader>f', {silent = true})
map('n', '<leader>sh', ':sp<CR><leader>f', {silent = true})

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
map('n', '<leader>f', '<cmd>lua require(\'telescope.builtin\').find_files()<CR>')
map('n', '<leader>rg', '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>')
map('n', '<leader>B', '<cmd>lua require(\'telescope.builtin\').buffers()<CR>')

-- Plugin: vim-commentary
map('n', '<leader>/', ':Commentary<CR>')

-- Plugin: vim-fugitive
map('n', '<leader>gs', ':Git status<CR>')
map('n', '<leader>gc', ':Git commit -am "')
map('n', '<leader>gp', ':Git push origin')
map('n', '<leader>gP', ':Git push origin main<CR>')
-- nnoremap <silent><expr><leader>f FugitiveHead() != '' ? ':GFiles<CR>' : ':Files<CR>'

-- Plugin: vim-gitgutter
map('n', ']g', ':GitGutterNextHunk<CR>')
map('n', '[g', ':GitGutterPrevHunk<CR>')
map('n', '<leader>gt', ':GitGutterToggle<CR>')

-----------------------------------------------------------
-- Visual Mode
-----------------------------------------------------------

map('v', 'J', ':m \'>+1<CR>gv=gv')
map('v', 'K', ':m \'<-2<CR>gv=gv')

-- Plugin: vim-commentary
map('v', '<leader>/', ':Commentary<CR>')

-----------------------------------------------------------
-- File Detections
-----------------------------------------------------------
