local M = {}

-- overriding default plugin configs!

M.nvimtree = {
  git = {
    enable = true,
  },
  view = {
    number = true,
  },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "cmp_tabnine" },
  },
  formatting = {
    format = function(entry, vim_item)
      local icons = require("plugins.configs.lspkind_icons")
      vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        buffer = "[BUF]",
        path = "[Path]",
        cmp_tabnine = "[TN]",
      })[entry.source.name]

      return vim_item
    end,
  },
}

return M
