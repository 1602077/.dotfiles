-------------------------------------------------------------------------------
-- vim-gitgutter.lua
-------------------------------------------------------------------------------

vim.cmd [[highlight GitGutterAdd    guifg=#009900 ctermfg=70]]
vim.cmd [[highlight GitGutterChange guifg=#bbbb00 ctermfg=214]]
vim.cmd [[highlight GitGutterDelete guifg=#ff2222 ctermfg=52]]

vim.g['gitgutter_sign_removed'] = '-'
vim.g['gitgutter_map_keys'] = false

