"Vim configuration file.

" Useful Key-bindings {{{ 
" IMPORTANT KEYS
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

" }}}

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'dense-analysis/ale'
    Plug 'vim-scripts/RltvNmbr.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/tagbar'
    Plug 'derekwyatt/vim-fswitch' " This is something i still did not set up!
    Plug 'jiangmiao/auto-pairs'
    Plug 'matze/vim-move'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'psliwka/vim-smoothie'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
 
    Plug 'junegunn/fzf.vim'

    Plug 'cocopon/iceberg.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'Badacadabra/vim-archery'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'scheakur/vim-scheakur'
    Plug 'lifepillar/vim-solarized8'

    Plug 'ryanoasis/vim-devicons'

    set encoding=UTF-8
call plug#end()
" }}}

" MAPPINGS --------------------------------------------------------------- {{{
" Setting leader key.
let mapleader= ","

" Terminal
nnoremap <leader>t :term<CR>

" Map <leader>\ to :RltvNmbr
nnoremap <leader>\ :RltvNmbr<CR>
" Map <leader>\ to :RltvNmbr
nnoremap <leader>\\ :RltvNmbr!<CR>
" Map <leader>w to :w
nnoremap <leader>w :w<CR>
" Map <leader>q to :wq
nnoremap <leader>q :wq<CR>

" fzf switching file
map ; :Files<CR>

"" Map INSERTMODE
" Map Word deletion
inoremap <c-d> <c-w>
inoremap <c-w> <c-o>dw

" MAP NAVIGATION
" Move to end of the line
nnoremap <leader>e $
" Move to beginnig of the line
nnoremap <leader>b 0

" Setting mappings for NERDTree.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<CR>

" Tagbar 
nmap <F8> :TagbarToggle<CR>

" Insert esc key mapping
inoremap jk <Esc>
inoremap kj <Esc>

" Uress the space bar t type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<ESc>
nnoremap O O<Esc>

" Center the cursor verticall when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Map the F5 key to run a Python script inside Vim.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>
" Map :split to leader-s and :vsplit to leader-vs
nnoremap <leader>s :split<CR>
nnoremap <leader>vs :vsplit<CR>
" havigate the split view easier by pressing C-j, C-k, C-h, Cl
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <h-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

nnoremap <esc><esc> :silent! nohls<cr>
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
" set terminal size
set termwinsize=12x0 
" Always split below
set splitbelow
" Enable mouse support.
" Set filetype off
filetype off

" Enable mouse 
set mouse=a

" Enable syntax.
syntax on

" Enable linu numbers. 
set number 

" Highlight cursor line underneath the cursor horizontally.
set cursorline 

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Setting colorscheme
colorscheme molokai

" Enable highlight search pattern.
set hlsearch

" Enable smartcase search sensitivity.
set ignorecase
set smartcase

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

" Show the matching part of pairs [] {} and ().
set showmatch

" Remove trailing whitespace from Python files.
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.f90 :%s/\s\+$//e
autocmd BufWritePre *.f95 :%s/\s\+$//e
autocmd BufWritePre *.for :%s/\s\+$//e

" Enable color themes.
set t_Co=256

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
set scrolloff=10

" While searching through a file incrementally highlight matching characters as
" You type.
set incsearch

" Set the command to save in history default number is 20.
" Set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to BAsh completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*png,*.gif,*pyc,*.exe,*.flv,*.img,*xlsx

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

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" NERDTree conf
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Set this variable to 1 to fix files when you save them.
let g:NERDTreeWinPos="left"
let NERDTreeWinSize=31
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeMinimalMenu=1
let NERDTreeShowLineNumbers=0

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

" Focus the panel when opening it
let g:tagbar_autofocus = 1" Highlight the active tag
let g:tagbar_autoshowtag = 1" Make panel vertical and place on the right
let g:tagbar_position = 'botright vertical'

" Vim-Move
let g:move_key_modifier='C'
let g:move_key_modifier_visualmode= 'S'


let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

let g:WebDevIconsUnicodeDecorateFileNodesDefaultsSymbol='x'

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
" }}}

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
