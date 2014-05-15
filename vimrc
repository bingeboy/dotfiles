set shell=/bin/bash
" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

"Allow F2 key to toggle paste from outside of vim and retain indents
set pastetoggle=<F2>

"Set up the clipboard to be shared across termi windows"
set clipboard=unnamed

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin 'gmarik/Vundle.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'Lokaltog/powerline.git'

"call vundle#rc()
" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'
execute pathogen#infect('bundle/{}', '~/.vim/bundle/{}')
"execute pathogen#infect()
"Helptags
"let g:powerline_loaded = 0
"let g:Powerline_symbols = 'fancy'
let mapleader = ","
"let g:Powerline_symbols = 'unicode'
syntax on  "Enables syntax highlighting for programming languages
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.
set tabstop=4  "How much space Vim gives to a tab
set number  "Enables line numbering
set smarttab  "Improves tabbing
set shiftwidth=4  "Assists code formatting
set splitbelow " New window goes below
set splitright " New windows goes right
set smartcase
set expandtab
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000

" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
set t_Co=256
"set t_Co=88
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

colorscheme badwolf  "Changes the color scheme. Change this to your liking. Lookin /usr/share/vim/vim61/colors/ for options.
setlocal spell  "Enables spell checking (CURRENTLY DISABLED because it's kinda annoying). Make sure to uncomment the next line if you use this.
set spellfile=~/.vimwords.add  "The location of the spellcheck dictionary. Uncomment this line if you uncomment the previous line.
set foldmethod=manual  "Lets you hide sections of code
map <Leader> <Plug>(easymotion-prefix)
"--- The following commands make the navigation keys work like standard editors
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
"--- Ends navigation commands
"--- The following adds a sweet menu, press F4 to use it.
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

set laststatus=2
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\

"Nerdtree toggle
nmap <silent> <C-D> :NERDTreeToggle<CR>