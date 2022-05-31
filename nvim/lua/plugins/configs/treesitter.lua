-----------------------------------------------------------
-- treesitter.lua
-----------------------------------------------------------

-- Install language servers using: `:TSInstall go`
require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "all",
  highlight = {
    enable = true
  },
}
