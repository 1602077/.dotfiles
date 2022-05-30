-----------------------------------------------------------
-- keymaps.lua
-----------------------------------------------------------

local api = vim.api

-- autocmd: file detections
vim.api.nvim_command([[
    augroup FileDetect
    autocmd FileType text setlocal spell
    autocmd FileType tex setlocal spell
    autocmd FileType markdown setlocal spell
    autocmd BufWritePre *.py execute ':Black'
    augroup END
]])

-- autocmd: gitgutter toggle in insert mode
vim.api.nvim_command([[
    augroup GitGutterToggle
    autocmd InsertEnter * :GitGutterDisable
    autocmd InsertLeave * :GitGutterEnable
    augroup END 
]])

-- autocmd: highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
})
