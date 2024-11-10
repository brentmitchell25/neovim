local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local ts_utils = require "nvim-treesitter.ts_utils"
local get_node_text = vim.treesitter.get_node_text

local gwt_node
gwt_node = function()
  local current_node = ts_utils.get_node_at_cursor()
  if not current_node then
    return ""
  end

  local expr = current_node

  while expr do
    if expr:type() == "expression_statement" then
      break
    end
    expr = expr:parent()
  end

  if not expr then
    return sn(
      nil,
      fmt(
        [[
          describe('given: {}', () => {{
            {}
          }});
        ]],
        { i(1, ""), c(2, { t "", d(1, gwt_node, {}) }) }
      )
    )
  end

  local txt = get_node_text(expr:child(0), 0)

  -- if txt has given in it, add when statement
  if txt:match "^describe%(['\"]when:" or txt:match "^describe%(['\"]and:" then
    return sn(
      nil,
      c(1, {
        fmt(
          [[
            it('then: {}', {} () => {{
              {}
            }});
          ]],
          { i(1, ""), c(3, { t "async", t "" }), i(2, "") }
        ),
        fmt(
          [[
            describe('and: {}', () => {{
                {}
            }});
          ]],
          { i(1, ""), c(2, { t "", d(1, gwt_node, {}) }) }
        ),
        fmt(
          [[
            beforeEach(async {{
                {}
            }});
          ]],
          { i(1, "") }
        ),
      })
    )
  end
  if txt:match "^describe%(['\"]given:" then
    return sn(
      nil,
      c(1, {
        fmt(
          [[
          describe('when: {}', () => {{
            {}
          }});
        ]],
          { i(1, ""), c(2, { t "", d(1, gwt_node, {}) }) }
        ),
        fmt(
          [[
            beforeEach(async {{
                {}
            }});
          ]],
          { i(1, "") }
        ),
      })
    )
  end
  -- if txt has when or and in it, choice node between and: and then:
  -- else add given statement

  --return args[1][1] .. user_arg_1
  return sn(
    nil,
    fmt(
      [[
          describe('given: {}', () => {{
            {}
          }});
        ]],
      { i(1, ""), c(2, { t "", d(1, gwt_node, {}) }) }
    )
  )
end

return {
  s({ trig = "gwt", dscr = "given, when, then jest block" }, d(1, gwt_node, {})),
}
