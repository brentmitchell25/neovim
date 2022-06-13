local ls = require "luasnip"
local selectChoice = require "luasnip.extras.select_choice"

local M = {}

M.markdown = {
  n = {
    ["<leader>m"] = { ":MarkdownPreview<CR>", "  toggle markdown preview" },
  },
}

M.general = {
  i = {
    ["<C-l>"] = "",
    ["jk"] = { "<Esc>", "  escape to normal mode" },
  },
  n = {
    ["<C-h>"] = { ":TmuxNavigateLeft<CR>", "  move left" },
    ["<C-l>"] = { ":TmuxNavigateRight<CR>", " move right" },
    ["<C-j>"] = { ":TmuxNavigateDown<CR>", " move down" },
    ["<C-k>"] = { ":TmuxNavigateUp<CR>", " move up" },
  },
}

M.luasnip = {
  n = {
    -- source luasnip
    ["<leader>S"] = { ":source ~/.config/nvim/lua/custom/plugins/luasnip.lua<CR>", "  source lua snippets" },
  },
  i = {
    ["<C-k>"] = {
      function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      " expand snippet or jump to next snippet",
      opts = { silent = true },
    },
    ["<C-j>"] = {
      function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end,
      " jump to previous snippet",
      opts = { silent = true },
    },
    ["<C-m>"] = {
      function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      " change choice",
    },
    ["<C-u>"] = {
      selectChoice,
      " select choice",
    },
  },
  v = {
    ["<C-k>"] = {
      function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end,
      " expand snippet or jump to next snippet",
      opts = { silent = true },
    },
    ["<C-j>"] = {
      function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end,
      " jump to previous snippet",
      opts = { silent = true },
    },
  },
}

M.copilot = {
  i = {
    ["<C-L>"] = {
      'copilot#Accept("<CR>")',
      "   copilot accept",
      opts = { expr = true, silent = true, script = true },
    },
  },
}

M.bufferline = {
  n = {
    ["<S-b>"] = "",
  },
}

M.buffers = {
  n = {
    ["<leader>."] = { "<cmd> enew <CR>", "烙 new buffer" },
  },
}

M.clipboard = {
  n = {
    ["<leader>Y"] = { '"+yg', "  yank to clipboard from cursor to end of line" },
    ["<leader>y"] = { '"+y', "  yank to clipboard" },
    ["<leader>yy"] = { '"+yy', "  yank line to clipboard" },
    ["<leader>p"] = { '"+p', "  paste from clipboard before cursor" },
    ["<leader>P"] = { '"+P', "  paste from clipboard after cursor" },
  },
  v = {
    ["<leader>y"] = { '"+y', "  clipboard" },
    ["<leader>p"] = { '"+p', "  paste from clipboard after cursor" },
    ["<leader>P"] = { '"+P', "  paste from clipboard before cursor" },
  },
}

M.lsp = {
  n = {
    ["<leader>i"] = { ":TSLspImportAll<CR>", "  lsp import all" },
  },
}

M.telescope = {
  n = {
    ["<C-P>"] = {
      ":Telescope find_files<cr>",
      "  find files in repository",
    },
  },
}

M.hop = {
  n = {
    ["<leader><leader>"] = { ":HopChar1<cr>", "  hop to specific character" },
  },
}

M.dadbod = {
  n = {
    ["<leader><leader>du"] = { ":DBUIToggle<CR>", "  toggle dadbod sql editor" },
    ["<leader><leader>df"] = { ":DBUIFindBuffer<CR>", "  dadbod find buffer" },
    ["<leader><leader>dr"] = { ":DBUIRenameBuffer<CR>", "  dadbod rename buffer" },
    ["<leader><leader>dl"] = { ":DBUILastQueryInfo<CR>", "  dadbod last query info" },
  },
}

M.lsp = {
  v = {
    ["<leader>ca"] = {
      "<cmd>lua vim.lsp.buf.range_code_action()<CR>",
      "  choose code action for visual selection",
    },
  },
  n = {
    ["<leader>i"] = { "<cmd>TSLspImportAll<CR>", "  typescript organize imports" },
    ["<leader>qf"] = { "<cmd>QuickFix<CR>", "  typescript quick fix" },
  },
}

return M
