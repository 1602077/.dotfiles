-----------------------------------------------------------
-- snippets.lua
-----------------------------------------------------------

-- help: https://github.com/L3MON4D3/LuaSnip

local ls = require("luasnip")

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return {os.date('%x')} end

ls.add_snippets(nil, {

    all = {
        snip({
            trig = "a",
            namr = "Name & Date",
            dscr = "Displays my name and current date",
        }, {
            text({"(Jack, "}),
            func(date, {}),
            text({")"}),
        }),
    },       

    go = {
        snip({
            trig = "td",
            namr = "Todo",
            dscr = "Write a TODO comment with name & date",
        }, {
            text({"// TODO (Jack, "}),
            func(date, {}),
            text({"): "}),
            insert(0),

        }),
        snip({
            trig = "fm",
            namr = "Fix Me",
            dscr = "Write a FIXME comment with name & date",
        }, {
            text({"// FIXME (Jack, "}),
            func(date, {}),
            text({"): "}),
            insert(0),

        }),
    },

    yaml = {
        snip({
            trig = "k8",
            namr = "Kubernetes Defaults",
            dscr = "Boilerplate config for writing Kubernetes definitions",
        }, {
            text({"apiVersion: "}), insert(0, "v1"), 
            text({"", "kind: "}), insert(1), 
            text({"", "metadata:", "  name: "}), insert(2),
            text({"", "spec:", "  "}), insert(3),
        }),
    },

})

require("luasnip.loaders.from_vscode").lazy_load()
