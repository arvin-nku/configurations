local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- NORMAL MODE
-- Optimization and fast keybindings
keymap.set("n", "<leader>yp", "yyp", opts)

-- IDE - Automation Configurations
-- Compiler Mapping
keymap.set("n", "<F7>c", ":w<CR> :!gcc % -o %< && ./%< <CR>", opts)
keymap.set("n", "<F7>p", ":w<CR> :!python3 % <CR>", opts)
keymap.set("n", "<F7>cc", ":w<CR> :!g++ -std=c++20 % -o %< && ./%< <CR>", opts)
-- System (outside of vim)
-- Open Terminal
keymap.set("n", "<leader>t", ":bot :term<CR>i", opts) -- remeber the esc insert for terminal is 'jj'

-- Buffer switch
-- Show all buffers-info
keymap.set("n", "<leader>bf", ":ls<CR>", opts)
-- Move to Buffer
keymap.set("n", "<leader>bb", ":bp<CR>", opts)
keymap.set("n", "<leader>bn", ":bn<CR>", opts)
-- Delete Buffer
keymap.set("n", "<leader>bc", ":w<CR> :bdelete<CR>", opts) -- save before
keymap.set("n", "<leader>bqt", ":bdelete!<CR>", opts) -- don't save

-- Normal Mode Navigation
keymap.set("n", "<leader>e", "$", opts)
keymap.set("n", "<leader>bh", "^", opts)

-- Fast Saving and Quitting File
keymap.set("n", "<leader>w", ":w<CR>", opts) -- save file
keymap.set("n", "<leader>c", ":wq<CR>:q<CR>", opts) -- save and quit file
keymap.set("n", "<leader>q1", ":q!<CR>", opts) -- forcequite and don't save

-- Entering Command Interface
keymap.set("n", " ", ":", opts)

-- Indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Newline for Normal Mode
keymap.set("n", "o", "o<Esc>", opts)
keymap.set("n", "O", "O<Esc>", opts)

-- Directory Navigation
keymap.set("n", "<leader>tr", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>ttr", ":NvimTreeToggle<CR>", opts)

-- Pane Navigation (on split windows)
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right

-- Pane Resizing
keymap.set("n", "<C-up>", "<C-w>+", opts) -- Navigate Left
keymap.set("n", "<c-down>", "<c-w>-", opts) -- navigate down
keymap.set("n", "<C-left>", "<C-w>>", opts) -- Navigate Up
keymap.set("n", "<C-right>", "<C-w><", opts) -- Navigate Right

-- Window Management [Splitting]
keymap.set("n", "<leader>s", ":split<CR>", opts) -- Split Horizontally
keymap.set("n", "<leader>v", ":vsplit<CR>", opts) -- Split Vertically
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle Minimize (you need a plugin for this)

-- Comments -> This comes from the plugin 'comment.lua'
vim.api.nvim_set_keymap("n", "<C-_>", "gcc<Esc>", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc<Esc>", { noremap = false })

-- INSERT MODE
-- Escaping Insert Mode
keymap.set("i", "jk", "<Esc>", opts)
keymap.set("i", "kj", "<Esc>", opts)

-- Deleting Word in Insert Mode
keymap.set("i", "<C-d>", "<C-w>", opts)
keymap.set("i", "<C-w>", "<C-o>dw", opts)
