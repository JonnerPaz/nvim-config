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

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tree
Plug 'preservim/nerdtree'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" themes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'dracula/vim',{'as':'dracula'}

" syntax 
Plug 'sheerun/vim-polyglot'

" IDE
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

" Airline theme
let g:airline_theme='simple'

" Tokyonigt theme config
let g:tokyonight_style = "night"

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

colorscheme tokyonight
