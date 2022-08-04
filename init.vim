set background=light
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

syntax on
set background=dark
set number
set mouse=a
set numberwidth=1
set encoding=utf-8
set showmatch
set showcmd
set ruler
set relativenumber
set laststatus=2
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width 
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'dracula/vim',{'as':'dracula'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

colorscheme dracula

