local types = require "luasnip.util.types"

require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/lua/custom/snippets" }

local M = {}

M.ls = {
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " <- Current Choice", "NonTest" } },
      },
    },
  },
}

return M
