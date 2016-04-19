#!/bin/bash

#set a higher than default ulimit.
ulimit -n 4096

#Get git for ps1
#npm@2 here:
#NPM2=/usr/local/node_modules/npm
NPM2=/Users/bingeboy/local/lib/node_modules/npm
NPM3=/usr/local/bin/npm
export PATH=$NPM2:/Users/$USER/local/selectedNodeVersion:/Users/$USER/local/bin:/usr/local/bin:/Developer/Scripts:/bin:/usr/local/sbin:/usr/bin:/sbin:/usr/sbin:/usr/local/share:/bin

#Set Editor
export VISUAL=vim
export EDITOR=$VISUAL
#export VIM=/usr/local/share/vim
set -o vi

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

bell=`tput bel`
precmd () {
    echo -n "$status $bell"
}
PROMPT='(#.#.>)%b '
RPROMPT=''

#Welcome Screen
echo "$(tput setaf 2)
`date +"%A, %e %B %Y, %X %Z"`
$(tput setaf 1)IP Addresses.......: $(tput setaf 6)`ipconfig getifaddr en0` and `wget -q -O - http://icanhazip.com/ | tail`
$(tput sgr0)"

#Bring in all the dotfiles
for file in ~/dotfiles/includesBash/{aliases,colors,commands,conde,gitcompletetion,git-prompt.sh,.cnbashrc,export,funtions,git,work,mine}; do
    [ -r "$file" ] && source "$file"
done
unset file

function git_info() {
	# check if we're in a git repo
	git rev-parse --is-inside-work-tree &>/dev/null || return

	# quickest check for what branch we're on
	branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

	# check if it's dirty (via github.com/sindresorhus/pure)
	dirty=$(git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ]&& echo -e "*")

	echo $WHITE" on "$PURPLE$branch$dirty
}

# Only show username/host if not default
function usernamehost() {
	if [ $USER != "$default_username" ]; then echo "${MAGENTA}$USER ${WHITE}at ${ORANGE}$HOSTNAME $WHITEin "; fi
}

function ffind(){
 find ./ -iname $1
}

PS1="\[$GREEN\]\[$RED\]\[$BLUE\]\u\[$YELLOW\] $(tput setaf 2)\]•$(tput setaf 5)\] \W\[$YELLOW\]\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\] $ "

export PATH=$PATH:$EC2_HOME/bin

alias tailmongo='tail -f /usr/local/var/log/mongodb/mongo.log'

alias vpn='yes yes | python vpn-script.py'

#git auto complete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

source ~/.bashrc
alias gitrebase2='git add -A && git commit -m'f' && git rebase -i HEAD~2'
