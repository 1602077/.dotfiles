-- LSP Setup
-- Servers:
-- 1. gopls: `go install golang.org/x/tools/gopls@latest`
-- 2. python: `pip3 install python-lsp-server`
-- 3. kubernetes: default yaml

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
    require("lspconfig")["gopls"].setup {
        capabilities = capabilities
}

vim.opt.completeopt={"menu", "menuone", "noselect"}
 

-- Autocompletions: nvim-cmp
local cmp = require"cmp"

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    })
})

-- Set attach mappings
local attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})

    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    -- Put telescope diagnostics in quickfix list using <Ctrl>+q

    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "R", vim.lsp.buf.references, {buffer=0})
end
 
-- Golang: gopls
require("lspconfig").gopls.setup{
    on_attach = attach
}

-- Python: pylsp
require("lspconfig").pylsp.setup{
    on_attach = attach
}

-- Kubernetes: yaml
require("lspconfig").yamlls.setup{
    settings = {
        yaml = {
            schemas = { kubernetes = "globPattern"},
        }
    }
}
