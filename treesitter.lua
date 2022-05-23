local exists, ts_configs = pcall(require, 'nvim-treesitter.configs')
if not exists then
  print('nvim-treesitter not installed')
  return
end

ts_configs.setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
      goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
      goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
      goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      }
    },
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ['gD'] = '@function.outer',
      },
    },
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
    },
  },
  refactor = {
    navigation = {
      enable = true,
    },
  },
  autopairs = { enable = true },
  autotag = { enable = true, disable = { 'markdown' } },
  context_commentstring = { enable = true, enable_autocmd = false },
  rainbow = { enable = true, extended_mode = true, max_file_lines = 1000 },
  pyfold = { enable = true, custom_foldtext = false },
  yati = { enable = true, disable = { 'python' } },
}

