" Vim configuration file.

" Useful tools for the terminal {{{
" vipw -> for adding and modifying information on the passwd file
" bat -> cat but more advanced! (good to overview code)
" watch -> with this command you can display the output of a command
" periodically
" you can switch vim files with the :edit command and then either <TAB> to find
" the fitting file you are searching for or 
" ctrl-d to find everything in the current directory
" }}}

" Useful Key-bindings {{{
" IMPORTANT KEYS
" c-c (when in command mode ':') -> cancels the whole command and leaves
" command mode! 
" c-f -> page down
" c-b -> page up
" c-d -> half page down
" c-u -> half page up
" H -> move cursor to the top of the current page position
" M -> move cursor to the middle of the current page position
" L -> move cursor to the bottom of the current page position
" zt -> move cursor position to the top of the page
" zz -> move cursor position to the middle of the page
" zb -> move cursor position to the bottom of the page
" normal mode: 
" w -> move cursor to the beginning of the next word
" b -> move cursor to the beginning of the previous word
" dw -> delete the next word
" insert mode:
" c-d -> delete word before the cursor (previous word)
" c-w -> delete word after the cursor (next word)

" Also you can get help for
" statusline
" autocmd
" map-modes

" How to move between directories in NERDTree
" u -> go to parentdirectory
" CC -> go to selected child directory
" j and k -> to select the child directory

" Autocompletion
" c-n -> select the next completed word
" c-p -> select the previous completed word

" Terminal
" leader-t -> open terminal
" c-d -> close terminal (or switch to terminal and type -exit-)

" Vim-Move
" NORMAL MODE
" c-j & c-k -> move cursor to line, then move current line/selections up/down
" VISUAL MODE
" s-j & s-k -> move current selected block up/down 

" tmux commands and usage
" c-o -> rotate the panes forwards
" c-z -> suspend the tmux client
" " -> split the current pane into two (top and bottom!)
" ! -> break the current pane out of the window
" # -> list all paste buffers
" $ -> rename the current session
" % -> split the current pane into two (left and right!)
" & -> kill the current window!
" ' -> prompt for a window index to select
" ` -> rename the current session!
" - -> delete the most recently copied buffer of text!
" . -> prompt for an index to move the current window
" 0 to 9 -> select windows 0 to 9
" : -> enter the tmux command prompt!
" ; -> move to the previously active pane
" ? -> list all key bindings
" [ -> enter copy mode to copy text or view the history 
" ] -> paste the most recently copied buffer of text
" c -> create a new window!
" d -> detach the current client
" f -> prompt to search for text in open windows!
" i -> display some information about the current window
" m -> mark the current pane -> (M -> clear the marked pane)
" q -> briefly display pane indexes
" t -> show the time
" x -> kill the current pane
" { -> swap the current pane with the previous pane
" } -> swap the current pane with the next pane
" ~ -> show previous messages from tmux, if any
" }}}

" MAPPINGS --------------------------------------------------------------- {{{
" Setting leader key.
let mapleader= ","

" Terminal
nnoremap <leader>t :term<CR>

" Map <leader>w to :w
nnoremap <leader>w :w<CR>
" Map <leader>q to :wq
nnoremap <leader>q :wq<CR>

"" Map INSERTMODE
" Map Word deletion
inoremap <c-d> <c-w>
inoremap <c-w> <c-o>dw

" MAP NAVIGATION
" Move to end of the line
nnoremap <leader>e $
" Move to beginnig of the line
nnoremap <leader>b ^

" Insert esc key mapping
inoremap jk <Esc>l
inoremap kj <Esc>l

" Press the space bar t type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<ESc>
nnoremap O O<Esc>

" Center the cursor verticall when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" PROGRAMMING
" PYTHON -------------------------------------------
" Map the F5 key to run a Python script inside Vim.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" Map :split to leader-s and :vsplit to leader-vs
nnoremap <leader>s :split<CR>
nnoremap <leader>vs :vsplit<CR>

" havigate the split view easier by pressing C-j, C-k, C-h, Cl
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

nnoremap <esc><esc> :silent! nohls<cr>
" }}}

" PLUGINS {{{
call plug#begin('~/.vim/plugged')
    Plug 'altercation/vim-colors-solarized'
call plug#end()
" }}}

" VIMSCRIPT {{{

" Indentation using spaces
" tabstop:	width of tab character
" softtabstop:	fine tunes the amount of whitespace to be added
" shiftwidth:	determines the amount of whitspace to add in normal mode
" expandtab:	when on use space instead of tab
" autoindent:	autoindent in new line
set tabstop 	=4
set softtabstop	=4
set shiftwidth	=4
set textwidth 	=79
set expandtab
set autoindent

" Set termwinsize=12x0
set termwinsize=12x0

" Always splitbelow
"set splitbelow

" Enable mouse support
"set mouse=a

" Set filetype off
filetype off

" Enable syntax
syntax on

" Enableline numbers.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Setting colorscheme
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" Enable highlight search pattern.
set hlsearch

" Enable smartcase search sensitivity.
set ignorecase
set smartcase

" Show the matching part of pairs [] {} and ().
set showmatch

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be abel to try to detect the type of
" File in use.
filetype on

" Enable plugins and load plugins for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Do not let cursor scroll below or above N number of lines when scrolling.
"set scrolloff=10

" While searching through a file incrementally highlight matching characters as
" You type.
"set incsearch

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker 
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

let g:skip_loading_mswin = 1

"}}}

" STATUS LINE ------------------------------------------------------------ {{{
" show the mode you are on the last line.
set showmode

" show partial command you type in the last line of the screen.
set showcmd

" show matching words during a search.
set showmatch

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
