set shell=/bin/bash
" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on
"set nocompatible
set runtimepath^=~/.vim/bundle/ctrlp.vim
"Allow F2 key to toggle paste from outside of vim and retain indents
set pastetoggle=<F2>
"Set up the clipboard to be shared across termi windows"
set clipboard=unnamed

"ignorecase 
set ignorecase

set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'gmarik/Vundle.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'Lokaltog/powerline.git'

"call vundle#rc()
" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'
execute pathogen#infect('bundle/{}', '~/.vim/bundle/{}')
let mapleader = ","
syntax on  "Enables syntax highlighting for programming languages
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set cursorline
set showmatch "Highlights matching brackets in programming languages
set matchtime=2
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.
set tabstop=2  "How much space Vim gives to a tab
set number  "Enables line numbering
set smarttab  "Improves tabbing
set shiftwidth=2  "Assists code formatting
set splitbelow " New window goes below
set splitright " New windows goes right
set smartcase
set expandtab
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=500 " Increase history from 20 default to 1000

" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
let g:syntastic_javascript_checkers = ['eslint']
colorscheme molokai "Changes the color scheme. Change this to your liking. Lookin /usr/share/vim/vim73/colors/ for options.
setlocal spell  "Enables spell checking (CURRENTLY DISABLED because it's kinda annoying). Make sure to uncomment the next line if you use this.
"set spellfile=~/.vimwords.add  "The location of the spellcheck dictionary. Uncomment this line if you uncomment the previous line.
set foldmethod=manual  "Lets you hide sections of code
map <Leader> <Plug>(easymotion-prefix)
"--- The following commands make the navigation keys work like standard editors
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
"--- Ends navigation commands
"--- The following adds a sweet menu, press F4 to use it.
"source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>

set laststatus=2
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set scrolloff=999

"show invinsibles
set listchars=eol:¬,tab:>-,extends:>,precedes:<
"trail:*
set list
"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active',
\ 'active_filetypes': ['javascript','eslint'],
\ 'passive_filetypes': ['javascript','eslint']
\}
"Nerdtree toggle
nmap <silent> <C-D> :NERDTreeToggle<CR>

"format JSON 
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
