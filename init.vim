set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.config/nvim/autoload/vimconfig.vimrc 
source ~/.config/nvim/autoload/mappings.vim

call plug#begin('~/.config/nvim/plugged')
" themes
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'dracula/vim',{'as':'dracula'}

" IDE
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy search
Plug 'easymotion/vim-easymotion' " search typing
Plug 'vim-airline/vim-airline' " status line (bottom line)
Plug 'vim-airline/vim-airline-themes' " status line themes
Plug 'preservim/nerdtree' " tree
Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocomplete
Plug 'mattn/emmet-vim' " Emmet for neovim
Plug 'Yggdroot/indentLine' " See indent lines
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

let g:indentLine_setColors = 0 " Makes indent line highlighting match with colorscheme
colorscheme tokyonight
