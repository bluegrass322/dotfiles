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
nnoremap <silent> bc<CR> :bdelete<CR>
nnoremap <silent> bc!<CR> :bdelete!<CR>
nnoremap <silent> gp :bprev<CR>
nnoremap <silent> gn :bnext<CR>

" edit
nnoremap Y y$

" files
nnoremap ;o :edit

" move
nnoremap <silent> gt gg
nnoremap <silent> ge G
nnoremap <silent> gh 0
nnoremap <silent> gs ^
nnoremap <silent> gl $

nnoremap <ESC><ESC> :nohlsearch<CR>
inoremap <silent> jj <ESC>
inoremap <silent> jk <ESC>

vnoremap < <gv
vnoremap > >gv

if ! has('nvim')
  call plug#begin()
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
  call plug#end()
endif

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>/ :Rg<CR>

if filereadable(expand("~/dotfiles/.vimrc.local"))
  source ~/dotfiles/.vimrc.local
endif

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
