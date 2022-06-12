-----------------------------------------------------------
-- autocmd.lua
-----------------------------------------------------------
local map = require("utils").map
local api = vim.api

-- augroup: standard buffer operations
api.nvim_create_augroup("bufcheck", { clear = true })

-- autocmd: highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    group = "bufcheck",
    command = "silent! lua vim.highlight.on_yank()",
})


-- augroup: file type detections
api.nvim_create_augroup("filedetect", { clear = true })

-- autocmd: Enable spell checking for certain file types
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = "filedetect",
    pattern = { "*.txt", "*.md", "*.tex" },
    command = "setlocal spell",
})

-- autocmd: run python formatter on buffer write
api.nvim_create_autocmd("BufWritePre", {
    group = "filedetect",
    pattern = "*.py",
    command = ":Black",
})

-- autocmd: recompile latex post buf write
api.nvim_create_autocmd("BufWritePost", {
    group = "filedetect",
    pattern = "*.tex",
    command = ":!pdflatex %",
})

-- autocmd: strip trailing whitespace
-- api.nvim_command([[
-- augroup stripWS
-- autocmd BufWritePre * :%s/\s\+$//e
-- augrou END
-- ]])

-- autocmd: go mappings
-- api.nvim_command([[
-- augroup GoMappings
-- autocmd FileType go map('n', '<leader>t', ':GoTest')
-- augroup END
-- ]])
