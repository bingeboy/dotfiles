dotfiles
========

Here are my dotfiles. Warning use @ your own risk.

If you are having issues with your localhost read this: `http://osxdaily.com/2012/10/24/set-the-hostname-computer-name-and-bonjour-name-separately-in-os-x/`

### Install
The following will generate specific symlinks predefined in the folder.

```
cd ~
git clone https://github.com/bingeboy/dotfiles
cd dotfiles
node symcreator
```

Sym link the following to home
```
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.viminfo ~/.viminfo
ln -s ~/dotfiles/.tmux.conf ~/.tmux
```

### Format JSON in VIM 
[http://visibletrap.blogspot.com/2010/05/vim-how-to-format-and-syntax-highlight.html](http://visibletrap.blogspot.com/2010/05/vim-how-to-format-and-syntax-highlight.html)
```

Run this command in shell 
sudo cpan JSON::XS
Put this line to ~/.vimrc 
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>
When want to format JSON file press
\jt
```

###Links to repos
[https://github.com/wookiehangover/jshint.vim](https://github.com/wookiehangover/jshint.vim)
[https://github.com/garbas/vim-snipmate](https://github.com/garbas/vim-snipmate)



###Plugins in use:
* CSApprox
* ag
* ctrlp.vim
* delimitMate
* gist-vim
* gundo.vim
* jshint.vim
* loremipsum
* nerdcommenter
* nerdtree
* node
* sparkup
* syntastic
* tabular
* tagbar
* taglist.vim
* tlib_vim
* vim-addon-mw-utils
* vim-easymotion
* vim-fakeclip
* vim-fugitive
* vim-haml
* vim-jade
* vim-javascript
* vim-powerline
* vim-repeat
* vim-sensible
* vim-snipmate
* vim-snippets
* vim-surround
* vundle
* webapi-vim
