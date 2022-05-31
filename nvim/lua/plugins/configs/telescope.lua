-----------------------------------------------------------
-- telescope.lua
-----------------------------------------------------------

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {".git", "undo", "node_modules"}
    }
}
