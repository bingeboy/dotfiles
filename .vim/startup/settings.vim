"Setting for poweline to show git and all the sexyness that comes with it
"let g:Powerline_symbols = 'fancy'
"to on by default
set list
"change to current dir when file opened
set autochdir
"Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Make the current line highlight
set cursorline
"searching ignores case
set ignorecase
"Easymotion leader setting
let g:EasyMotion_leader_key = '<Leader>' 
"Seeting for powerline
set fillchars+=stl:\ ,stlnc:\
set scrolloff=5
"------------ Code Folding ----------------"
au BufWinLeave * mkview
au BufWinEnter * loadview
".swo file was availble..... now i question if this will load in the cursor
"position propperly.

"------------ Relative / Absolute Line Numbers ----------------"
au Focuslost * :set number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
