local ls = require "luasnip"

local s = ls.snippet
local f = ls.function_node

local function bash(_, _, command)
  local file = io.popen(command, "r")
  local res = {}
  for line in file:lines() do
    table.insert(res, line)
  end
  return res
end

return {
  s({ trig = "uuid", dscr = "generate uuid" }, {
    f(bash, {}, { user_args = { 'uuidgen | tr "[A-Z]" "[a-z]"' } }),
  }),
}
