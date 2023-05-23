local M = {}

-- overriding default plugin configs!

M.nvimtree = {
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
    ignore = true,
  },
  view = {
    number = true,
  },
}

M.telescope = {
  defaults = {
    file_sorter = nil,
    generic_sorter = nil,
    file_ignore_patterns = { "node_modules/", ".yarn/", ".git/" },
  },
  pickers = {
    find_files = {
      find_command = {
        "fd",
        "--hidden",
        "--type",
        "f",
      },
    },
    git_files = {},
  },
  extensions = {
    fzf = {},
    luasnip = {},
  },
}

M.treesitter = {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
      goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
      goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
      goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["gD"] = "@function.outer",
      },
    },
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
    },
  },
  refactor = {
    navigation = {
      enable = true,
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  autopairs = { enable = true },
  autotag = { enable = true, disable = { "markdown" } },
  context_commentstring = { enable = true, enable_autocmd = false },
  rainbow = { enable = true, extended_mode = true, max_file_lines = 1000 },
  pyfold = { enable = true, custom_foldtext = false },
  yati = { enable = true, disable = { "python" } },
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
