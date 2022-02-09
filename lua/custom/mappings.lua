local map = require("core.utils").map

vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("\\<CR>")', { silent = true, script = true, expr = true })
vim.g.copilot_no_tab_map = true
vim.g.mapleader = " "

-- mundo
vim.api.nvim_command("set undofile")
vim.api.nvim_command("set undodir=~/.vim/undo")

-- neovim
map("t", "<a-a>", "<esc>a")
map("t", "<a-b>", "<esc>b")
map("t", "<a-d>", "<esc>d")
map("t", "<a-f>", "<esc>")

-- buffers
map("n", "<leader>.", ":bnext<CR>")
map("n", "<leader>,", ":bprev<CR>")

-- copy clipboard
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg')
map("n", "<leader>y", '"+y')
map("n", "<leader>yy", '"+yy')

-- paste clipboard
map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>p", '"+p')
map("v", "<leader>P", '"+P')

-- telescope
map("n", "<C-P>", ":Telescope find_files<cr>")
map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<leader>fg", ":Telescope live_grep<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")

-- nvim tree
map("n", "<leader>nt", ":NvimTreeToggle<cr>")
map("n", "<leader>nr", ":NvimTreeRefresh<cr>")
map("n", "<leader>nn", ":NvimTreeFindFile<cr>")

-- hop
map("n", "<leader><leader>", ":HopChar1<cr>")
