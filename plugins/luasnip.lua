local M = {}

local function override()
  local types = require "luasnip.util.types"

  require("luasnip.loaders.from_lua").lazy_load { paths = "~/.config/nvim/lua/custom/snippets" }

  return {
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { " <- Current Choice", "NonTest" } },
        },
      },
    },
  }
end

M.override = override

return M
