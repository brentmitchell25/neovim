local map = vim.api.nvim_set_keymap

-- copilet
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

map(
  "",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
  {}
)
map(
  "",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
  {}
)
map(
  "",
  "t",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
  {}
)
map(
  "",
  "T",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
  {}
)

-- dial
map("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
map("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
map("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
map("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
map("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
map("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })

-- mundo
vim.api.nvim_command "set undofile"
vim.api.nvim_command "set undodir=~/.vim/undo"

-- formatting
vim.cmd "autocmd BufWritePost *.{heex} silent! !mix format %"
