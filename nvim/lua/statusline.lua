-----------------------------------------------------------
-- statusline.lua
-----------------------------------------------------------

-- Git Branch
vim.g['git_branch'] = ''

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
-- TODO: finish

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation# " .. count["info"]
  end

  return string.format(" %s %s %s", errors, warnings, hints, info)
end

vim.api.nvim_create_autocmd({'bufwritepost'}, {
    callback = function()
        vim.g.lspDiag = lsp()
    end
})


-- Build Statusline
Statusline = {}

Statusline.active = function()
  return table.concat {
   "%#GruvboxGreen#",
    vim.g['git_branch'],
    "%#LineNr#",
    " %f",
    "%m  ",
    -- vim.g['lspDiag'],
    "%=",
    "%{&fileencoding?&fileencoding:&encoding}",
    " [%p%%]",
  }
end

function Statusline.inactive()
  return " %F"
end

function Statusline.short()
  return "%#StatusLineNC#   NvimTree"
end

-- Create augroup to determine when & what to display
vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)


