--require "custom.mappings"

-- copilet
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- mundo
vim.api.nvim_command "set undofile"
vim.api.nvim_command "set undodir=~/.vim/undo"

-- formatting
vim.cmd "autocmd BufWritePost *.{heex} silent! !mix format %"

require("telescope").load_extension "fzf"
