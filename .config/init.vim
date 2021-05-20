"
"plugins 
"
"install vim plug first
"
"========================================================
"sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"========================================================
"
"
call plug#begin('~/.config/nvim/plugged')
" Tools
    Plug 'vifm/vifm.vim'
    Plug 'junegunn/limelight.vim'
    " requires node installed pacman -S nodejs npm(for arch)
    " :CocInstall coc-clangd for c++ after installation
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ctrlpvim/ctrlp.vim'
" Syntax
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
" Color-schemes
    Plug 'morhetz/gruvbox' "My favorite theme
call plug#end()
"
"General settings
"
set encoding=UTF-8
syntax on
set number relativenumber
set spell spelllang=en_us
set backspace=indent,eol,start confirm
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set hls is ic
set laststatus=2 cmdheight=1

"
"Status-line
"
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]
"
"Keybindings
"
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

"
"Color Settings
"
colorscheme gruvbox
set background=dark cursorline
hi clear CursorLine
set termguicolors
