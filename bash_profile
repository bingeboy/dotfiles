#!/bin/bash

############### HOT MESS ###################################
#Get git for ps1
source ~/.git-prompt.sh
export PATH=$HOME/Developer/Scripts:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/share/:$PATH

#:$GOPATH/bin
#sudo nvram boot-args="-v"
#sudo nvram SystemAudioVolume=%80
#Set Editor
export VISUAL= vim
export EDITOR=$VISUAL
#export VIM=/usr/local/share/vim 
set -o vi


# init z https://github.com/rupa/z
. ~/dotfiles/z/z.sh

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
for file in ~/dotfiles/includesBash/{aliases,colors,commands,golf,gitcompletetion,git-prompt.sh,.cnbashrc,export,cnbashrc,funtions,git,work,mine}; do
    [ -r "$file" ] && source "$file"
done
unset file

#for file in ~/dotfiles/includesBash/.{aliases,colors,commands,export,cnbashrc,functions,svnextras,work,mine,osx}; do

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


#Pizzq Prompt 
#PS1="[\[\033[36m\]\u\[\033[37m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]]$ "
PS1="🍕 \[$(tput setaf 2)\] \W $(__git_ps1 "\[$(tput setaf 5)\](%s)") \[$(tput setaf 3)\]$ \[$(tput setaf 7)\]"

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:$EC2_HOME/bin
export testNumber='+19173650744'
#RAM FOR MAVEN
#export MAVEN_OPTS="-XX:MaxPermSize=512m -Dmaven.test.skip=true";

alias tailmongo='tail -f /usr/local/var/log/mongodb/mongo.log'
alias golfpro='cd ~/golf/projects/golfdigest'

#git auto complete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#RVM not installed kid! Uncomment the below when you install 
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#eval "$(rbenv init -)"

#old commened out hotness when you have a fast connection 

#$(tput setaf 1)Weather............: $(tput setaf 3)Brooklyn `curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?metric=211&LOCCODE=11211" | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`


export NVM_DIR="/Users/jmcgarr1/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
