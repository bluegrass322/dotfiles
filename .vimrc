" ============================
"   Basic
" ============================
set number
set relativenumber

set autoread
set cmdheight=2

set showmatch
set matchtime=1
set smartcase

set hlsearch
set ignorecase
set incsearch
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2

set cursorline
set nowrap

set background=dark
set noshowmode
set laststatus=2


" ============================
"   Keymaps
" ============================
let mapleader = "\<Space>"

" buffer
nnoremap ;bc :bdelete<CR>
nnoremap ;bc! :bdelete!<CR>
nnoremap ;bn :enew<CR>

" edit
nnoremap Y y$

" files
nnoremap ;o :edit

" move
nnoremap <silent> gt gg
nnoremap <silent> gb G
nnoremap <silent> gh ^
nnoremap <silent> gl $
nnoremap <silent> gp :bprev<CR>
nnoremap <silent> gn :bnext<CR>

inoremap <silent> jj <ESC>
inoremap <silent> jk <ESC>

vnoremap < <gv
vnoremap > >gv


" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
