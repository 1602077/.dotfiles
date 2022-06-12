-----------------------------------------------------------
-- autocmd.lua
-----------------------------------------------------------
local map = require("utils").map
local api = vim.api

-- augroup: standard buffer operations
api.nvim_create_augroup("bufops", { clear = true })

-- autocmd: highlight on yank
api.nvim_create_autocmd("bufops", {
    group = "buf",
    command = "silent! lua vim.highlight.on_yank()",
})

-- autocmd: git messages start in insert mode
api.nvim_create_autocmd("FileType",     {
    group    = "bufops",
    pattern  = { "gitcommit", "gitrebase", },
    command  = "startinsert | 1"})

-- autocmd: Return to last edit position when opening files
api.nvim_create_autocmd("BufReadPost",  {
    group    = "bufops",
    pattern  = "*",
    callback = function()
      if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
         fn.setpos('.', fn.getpos("'\""))
         vim.api.nvim_feedkeys("zz", "n", true)
         end end })

 -- autocmd: file detections
 api.nvim_command([[
 augroup FileDetect
 autocmd FileType text setlocal spell
 autocmd FileType tex setlocal spell
 autocmd FileType markdown setlocal spell
 autocmd BufWritePre *.py execute ':Black'
 augroup END
 ]])

 -- autocmd: strip trailing whitespace
 api.nvim_command([[
 augroup stripWS
 autocmd BufWritePre * :%s/\s\+$//e
 augrou END
 ]])

 -- autocmd: gitgutter toggle in insert mode
 -- vim.api.nvim_command([[
 --     augroup GitGutterToggle
 --     autocmd InsertEnter * :GitGutterDisable
 --     autocmd InsertLeave * :GitGutterEnable
 --     augroup END
 -- ]])

-- autocmd: go mappings
api.nvim_command([[
augroup GoMappings
autocmd FileType go map('n', '<leader>t', ':GoTest')
augroup END
]])

-- autocmd:latex
api.nvim_command([[
augroup FileTypeDetect
autocmd BufNewFile,BufRead *t.tex map('n', '<leader>pl', ':!pdflatex %<CR>')
augroup END
]])
