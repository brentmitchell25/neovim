local M = {}

local map = nvchad.map

-- dial
map("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
map("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
map("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
map("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
map("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
map("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })

M.markdown = {
  n = {
    ["<leader>m"] = { ":MarkdownPreview<CR>", "  toggle markdown preview" },
  },
}

M.general = {
  i = {
    ["<C-l>"] = "",
  },
  n = {
    ["<C-h>"] = { ":TmuxNavigateLeft<CR>", "  move left" },
    ["<C-l>"] = { ":TmuxNavigateRight<CR>", " move right" },
    ["<C-j>"] = { ":TmuxNavigateDown<CR>", " move down" },
    ["<C-k>"] = { ":TmuxNavigateUp<CR>", " move up" },
  },
}

M.copilot = {
  mode_opts = { expr = true },
  i = {
    ["<C-L>"] = { 'copilot#Accept("<CR>")', "   copilot accept" },
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
