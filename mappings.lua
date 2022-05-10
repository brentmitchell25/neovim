local map = nvchad.map

vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("\\<CR>")', { silent = true, script = true, expr = true })
vim.g.copilot_no_tab_map = true
vim.g.mapleader = " "

-- mundo
vim.api.nvim_command "set undofile"
vim.api.nvim_command "set undodir=~/.vim/undo"

vim.cmd "autocmd BufWritePre *.{rs,json,yaml,yml,ts,js,lua,go,py} lua vim.lsp.buf.formatting_sync()"
vim.cmd "autocmd BufWritePost *.{ex,eex,leex,heex} silent! !mix format %"

-- neovim
map("t", "<a-a>", "<esc>a")
map("t", "<a-b>", "<esc>b")
map("t", "<a-d>", "<esc>d")
map("t", "<a-f>", "<esc>")
map("n", "<leader>m", ":MarkdownPreview<CR>")

-- dial
--map("n", "<C-a>", dial.inc_normal())
--map("n", "<C-x>", dial.dec_normal())
--map("v", "<C-a>", dial.inc_visual())
--map("v", "<C-x>", dial.dec_visual())
--map("v", "g<C-a>", dial.inc_gvisual())
--map("v", "g<C-x>", dial.dec_gvisual())
map("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
map("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
map("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
map("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
map("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
map("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })

--
map("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
map("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

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

-- dad-bod
map("n", "<leader><leader>du", ":DBUIToggle<CR>")
map("n", "<leader><leader>df", ":DBUIFindBuffer<CR>")
map("n", "<leader><leader>dr", ":DBUIRenameBuffer<CR>")
map("n", "<leader><leader>dl", ":DBUILastQueryInfo<CR>")

map("v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")
map("n", "<leader>i", "<cmd>TSLspImportAll<CR>")
map("n", "<leader>qf", "<cmd>QuickFix<CR>")
