-------------------------------------------------------------------------------
-- nerdtree.lua
-------------------------------------------------------------------------------

local options = {
    NERDTreeMinimalUI = true,
    NERDTreeRespectWildIgnore = true,
    NERDTreeShowHidden = true,
    NERDTreeQuitOnOpen = true,
}

for key, value in pairs(options) do
    vim.g[key] = value
end

