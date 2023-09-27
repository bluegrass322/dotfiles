" ============================
"   Basic
" ============================
set number
set relativenumber

set autoread
set cmdheight=2

set showmatch
set matchtime=1

set hlsearch
set ignorecase
set incsearch
set smartcase
set autoindent
set expandtab
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set nowrap


" ============================
"   Keymaps
" ============================
let mapleader = "\<Space>"

nnoremap Y y$

inoremap <silent> jj <ESC>
inoremap <silent> jk <ESC>

vnoremap < <gv
vnoremap > >gv


" ============================
"   Plugins
" ============================
call plug#begin()
Plug 'LunarWatcher/auto-pairs'
call plug#end()

