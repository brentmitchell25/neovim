local present, ls = pcall(require, "luasnip")
if not present then
  --print("luasnip not found, please install it")
  return
end
--print("luasnip not found, please install it")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.snippets = {
  typescript = {
    -- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
    -- \item as necessary by utilizing a choiceNode.
    s("trigger", {
      t({ "", "After expanding, the cursor is here ->" }),
      i(1),
      t({ "After jumping forward once, cursor is here ->" }),
      i(2),
      t({ "", "After jumping once more, the snippet is exited there ->" }),
      i(0),
    }),
  },
}
