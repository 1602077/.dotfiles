-----------------------------------------------------------
-- statusline.lua
-----------------------------------------------------------

-- Git Branch
vim.g["git_branch"] = ""

function GitBranch()
    local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
    if branch ~= "" then
        return string.format('  %s', branch)
    else
        return ""
    end
end

vim.api.nvim_create_autocmd({"FileType", "BufEnter", "FocusGained"}, {
	callback = function()
		vim.g.git_branch = GitBranch()
	end
})

-- LSP Diagnostics

vim.g["flagErrors"] = ""

local function flagErrors ()
    local count = vim.tbl_count(vim.diagnostic.get(0, {severity = "Error"}))
    if count ~= 0 then
        return "%#GruvboxRed#  "
    else
        return ""
    end
end

-- Note: If calling function in statusline causes issues
-- which to using this aucmd.

-- vim.api.nvim_create_autocmd({'BufWrite'}, {
--     callback = function()
--         vim.g.flagErrors = flagErrors()
--     end
-- })



-- Build Statusline
Statusline = {}

Statusline.active = function()
  return table.concat {
   "%#GruvboxGreen#",
    vim.g['git_branch'],
    "%#LineNr#",
    " %f",
    -- vim.g['flagErrors'],
    flagErrors(),
    "%m %#LineNr#",
    "%=",
    "%{&fileencoding?&fileencoding:&encoding}",
    " [%p%%]",
  }
end

function Statusline.inactive()
  return table.concat {
   "%#GruvboxGreen#",
    vim.g['git_branch'],
    "%#LineNr#",
    " %f",
}
end


-- Create augroup to determine when & what to display
vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]], false)

-----------------------------------------------------------
-- Graveyard
-----------------------------------------------------------

-- LSP Diagnostics (Full)

-- vim.g["lspDiag"] = ""
-- local function lsp()
--     local result = {}
--     local levels = {
--         errors = 'Error',
--         warnings = 'Warning',
--         info = 'Information',
--     }

--     for k, level in pairs(levels) do
--         result[k] = vim.lsp.diagnostic.get_count(0, level)
--     end

--     local errors = ""
--     local warnings = ""
--     local info = ""

--     if result['errors'] ~= 0 then
--         errors = " %#GruvboxRed#  " .. result['errors']
--     end

--     if result['warnings'] ~= 0 then
--         warnings = " %#GruvboxOrange#  " .. result['warnings']
--     end

--     if result['info'] ~= 0 then
--         info = " %#GruvboxYellow#  " .. result['info']
--     end

--     return errors .. warnings .. info .. "%#Normal#"
-- end

-- vim.api.nvim_create_autocmd({'BufWrite'}, {
--     callback = function()
--         vim.g.lspDiag = lsp()
--     end
-- })

-- help: list highlight groups with: `:so $VIMRUNTIME/syntax/hitest.vim`
