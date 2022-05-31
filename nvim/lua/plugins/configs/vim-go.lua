-----------------------------------------------------------
-- vim-go.lua
-----------------------------------------------------------

local options = {
    go_fmt_command = "goimports",
    go_template_autocreate = false,
    go_auto_type_info = true,
    go_highlight_build_constraints = true,
    go_highlight_extra_types = true,
    go_highlight_fields = true,
    go_highlight_functions = true,
    go_highlight_methods = true,
    go_highlight_operators = true,
    go_highlight_structs = true,
    go_highlight_types = true,
}

for key, value in pairs(options) do
    vim.g[key] = value
end

