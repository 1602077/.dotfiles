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

local fmt = require("luasnip.extras.fmt").fmta

local date = function() return {os.date('%x')} end

ls.add_snippets(nil, {

    all = {
        snip({
            trig = "a",
            namr = "Name & Date",
            dscr = "Displays my name and the current date",
        },{
            text({"(Jack, "}),
            func(date, {}),
            text({")"}),
        }),
    },       

    go = {
        snip({
            trig = "td",
            dscr = "Writes a TODO comment with name & date",
        },{
            text({"// TODO (Jack, "}),
            func(date, {}),
            text({"): "}),
            insert(0),

        }),
        snip({
            trig = "fm",
            dscr = "Writes a FIXME comment with name & date",
        }, {
            text({"// FIXME (Jack, "}),
            func(date, {}),
            text({"): "}),
            insert(0),

        }),
        snip({
            trig = "ff",
            dscr = "Creates a go function",
        },{
            text({"func "}), insert(1, "xxx"), text({"("}),
            insert(2),
            text({"){","   "}),
            insert(3),
            text({"", "}"}),
        }),
        snip({
            trig = "main",
            dscr = "Creates a main function"

        },{
            text({"func main() {", "    "}),
            insert(0),
            text({"", "}"}),

        }),
        snip({
            trig = "forr",
            dscr = "Create a for-range loop.",
        },{
            text({"for "}), insert(1), text({" , "}),
            insert(2), text({" := range "}), insert(3),  text({" {"}),
            text({"","  "}), insert(4),
            text({"", "}"}),
        }),
        snip({
            trig="pf",
            dscr="fmt.Printf()"
        },{
            text({'fmt.Printf("'}),insert(1), text({'", '}), insert(2), text({")"})
        }),
        snip({
            trig="lf",
            dscr="log.Printf()"
        },{
            text({'log.Printf("'}),insert(1), text({'", '}), insert(2), text({")"})
        }),
        snip({
            trig="pl",
            dscr="fmt.Println()"
        },{
            text({"fmt.Println("}),insert(1), text({")"})
        }),
        snip({
            trig="ll",
            dscr="log.Println()"
        },{
            text({"log.Println("}),insert(1), text({")"})
        }),
        snip({
            trig="gf",
            dscr="Create a go func()"
        },{
            text({"go func("}), insert(1), text({") {"}),
            text({"", "    "}), insert(2),
            text({"", "}("}), insert(3), text({")", ""})

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

-- require("luasnip.loaders.from_vscode").lazy_load()
