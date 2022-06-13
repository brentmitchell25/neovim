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

M.telescope = {
  defaults = {
    file_sorter = nil,
    generic_sorter = nil,
    file_ignore_patterns = { "node_modules", ".yarn", ".git" },
  },
  pickers = {
    find_files = {
      find_command = {
        "fd",
      },
      hidden = true,
    },
    git_files = {},
  },
  extensions = {
    fzf = {},
    luasnip = {},
  },
}

M.cmp = {
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "cmp_tabnine" },
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        cmp_tabnine = "[TN]",
      })[entry.source.name]

      return vim_item
    end,
  },
}

return M
