-- Local variables
local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- PLUGINS
-- TREE-SITTER -> KEYMAPS
-- [SELECTION]
-- 'gnn' [init_selection]: "Initializes the selection -> This starts the selection process
-- 			    at the current curser position."
-- 'grn' [node_incremental]: "Expands the selection to the next node -> Each press of the key
-- 			      will incrementally select a larger synntactic unit."
-- 'grc' [scope_incremental]: "Expands the selection to the next scope -> Scopes are larger
-- 			       units that can include functions or other block structures."
-- 'grm' [node_decremental]: "Contracts the selection to the previous node."
--[TEXT-OBJECTS] -> used with operator commands like 'daf' (deletes the entire function)
-- 'af': Select around the outer part of a function.
-- 'if': Select the inner part of a function.
-- 'ac': Select around the outer part of a class.
-- 'ic': Select the inner part of a class.

-- FOLDING-KEYMAPS
-- zf#j creates a fold from the cursor down # lines.
-- zj -> moves the cursor to the next fold.
-- zk -> moves the cursor to the prev fold.
-- zo -> opens a fold at the cursor.
-- zO -> opens all folds at the cursor.
-- zm -> increases the foldlevel by one.
-- zM -> closes all open folds.
-- zr -> dereases the foldlevel by one.
-- zR -> decreases the foldlevel to zero -> all folds will be open.
-- zd -> deletes the fold at the cursor.
-- zE -> delets all folds.
-- [z -> move to start of open fold.
-- ]z -> move to end of open fold.

-- TELESCOPE -> KEYMAPS
-- function to select different instances of TC
keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")


-- NORMAL MODE
-- Optimization and fast keybindings
-- copy line and duplicate it to the next line
keymap.set("n", "<leader>yp", "yyp", opts)
-- selecting block
keymap.set("n", "<leader>bv", "<C-v>", opts)

-- IDE - Automation Configurations
-- Compiler Mapping
-- c compiling
keymap.set("n", "<F7>c", ":w<CR> :!gcc % -o %< && ./%< <CR>", opts)
-- python compiling
keymap.set("n", "<F7>p", ":w<CR> :!python3 % <CR>", opts)
-- c++ compiling
keymap.set("n", "<F7>cc", ":w<CR> :!g++ -std=c++20 % -o %< && ./%< <CR>", opts)

-- System (outside of vim)
-- Open Terminal
keymap.set("n", "<leader>t", ":bot :term<CR>i", opts) -- remeber the esc insert for terminal is 'jj'

-- Buffer switch
-- Show all buffers-info
keymap.set("n", "<leader>bf", ":ls<CR>", opts)
-- Move to Buffer
-- NEED TO BE REMOVED IF NOT EFFECTIVE
keymap.set("n", "<leader>bb", ":bp<CR>", opts)
keymap.set("n", "<leader>bn", ":bn<CR>", opts)
-- Delete Buffer
keymap.set("n", "<leader>bc", ":w<CR> :bdelete<CR>", opts) -- save before
keymap.set("n", "<leader>bqt", ":bdelete!<CR>", opts) -- don't save

-- Normal Mode Navigation
-- move to the end of the line
keymap.set("n", "<leader>e", "$", opts)
-- move to the beginning of the line
keymap.set("n", "<leader>bh", "^", opts)

-- Fast Saving and Quitting File
keymap.set("n", "<leader>w", ":w<CR>", opts) -- save file
keymap.set("n", "<leader>c", ":wq<CR>:q<CR>", opts) -- save and quit file
keymap.set("n", "<leader>q1", ":q!<CR>", opts) -- forcequite and don't save

-- Entering Command Interface
keymap.set("n", " ", ":", opts) -- space will enter command interface

-- Indentation
keymap.set("v", "<", "<gv") -- move right
keymap.set("v", ">", ">gv") -- move left

-- Newline for Normal Mode
keymap.set("n", "o", "o<Esc>", opts) -- move curser to new next line
keymap.set("n", "O", "O<Esc>", opts) -- move curser to new previous line

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
-- MIGHT HAVE TO REMOVE THIS IF NOT EFFECTIVE
-- vim.api.nvim_set_keymap is traditional way to setting kepmappings
-- the new module provided by Neovim that allows you to set key mappings
-- in a more structured and modern way is vim.keymap
-- vim.api.nvim_set_keymap("n", "<C-_>", "gcc<Esc>", { noremap = false })
-- vim.api.nvim_set_keymap("v", "<C-_>", "gcc<Esc>", { noremap = false })

-- INSERT MODE
-- Escaping Insert Mode
keymap.set("i", "jk", "<Esc>", opts)
keymap.set("i", "kj", "<Esc>", opts)

-- Deleting Word in Insert Mode
keymap.set("i", "<C-d>", "<C-w>", opts) -- delete previous word
keymap.set("i", "<C-w>", "<C-o>dw", opts) -- delete next word

