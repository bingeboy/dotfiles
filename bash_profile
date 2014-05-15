#!/bin/bash

#sudo nvram boot-args="-v"
#sudo nvram SystemAudioVolume=%80
#Set Editor
export VISUAL=vim
export EDITOR=$VISUAL
set -o vi


# init z https://github.com/rupa/z
. ~/dotfiles/z/z.sh

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence. This is for homebrew!
#export PATH=/usr/local/bin:/usr/bin:/usr/local/share/npm/bin:/usr/sbin:/sbin
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:~/bin:$PATH
#export NODE_PATH=/usr/local/lib/node
export NODE_PATH=$NODE_PATH:/usr/local/share/npm/lib/node_modules
#export PATH=/usr/local/share/npm/bin:$PATH

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
$(tput setaf 1)Weather............: $(tput setaf 3)Brooklyn `curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?metric=211&LOCCODE=11211" | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`
$(tput sgr0)"

#Bring in all the dotfiles
for file in ~/dotfiles/bashcustom/.{aliases,colors,commands,export,functions,svnextras,work,mine,osx}; do
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

#Prompt 
#PS1="[\[\033[36m\]\u\[\033[37m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]]$ "
PS1="🍕 \[$(tput setaf 2)\] \W \[$(tput setaf 3)\]$ \[$(tput setaf 7)\]"

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:$EC2_HOME/bin
export testNumber='+19173650744'

#RAM FOR MAVEN
export MAVEN_OPTS="-XX:MaxPermSize=512m -Dmaven.test.skip=true";

#Mongod tail
alias tailmongo='tail -f /usr/local/var/log/mongodb/mongo.log'

#git auto complete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(rbenv init -)"

#TODO Move to aliases for node repl
alias node="env NODE_NO_READLINE=1 rlwrap node"


