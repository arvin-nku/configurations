-- Global
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.wrap = true
opt.autoindent = true
vim.o.textwidth = 80

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
-- opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
--highlight on yank
vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'YankHighlight',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 300 })
  end,
})

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.guicursor =
        "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"

-- Folding
vim.opt.viewoptions = {'folds', 'cursor'}

-- Create an augroup for saving and loading folds
vim.api.nvim_create_augroup('SaveFolds', {clear = true})

-- Automatically save folds when leaving a buffer
vim.api.nvim_create_autocmd('BufWinLeave', {
  group = 'SaveFolds',
  pattern = '*.*',
  command = 'mkview'
})

-- Automatically load folds when entering a buffer
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = 'SaveFolds',
  pattern = '*.*',
  command = 'silent! loadview'
})
