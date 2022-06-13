local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    { trig = "gwt", dscr = "given, when, then jest block" },
    fmt(
      [[
        describe("given: {}", () => {{
          describe("when: {}", () => {{
            it("then: {}", {} () => {{
              {}
            }});
          }});
        }});
      ]],
      {
        -- i(1) is at nodes[1], i(2) at nodes[2].
        i(1, ""),
        i(2, ""),
        i(3, ""),
        c(5, { t "async", t "" }),
        i(4, ""),
      }
    )
  ),
}
