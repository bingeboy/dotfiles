#!/bin/bash
if [ -e /etc/passwd ]; then echo "BLAP"
else : echo "missing work dude"
fi
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence. This is for homebrew!
#export PATH=/usr/local/bin:/usr/bin:/usr/local/share/npm/bin:/usr/sbin:/sbin
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:~/bin:$PATH
#export NODE_PATH=/usr/local/lib/node
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
for file in ~/Dropbox/dotfiles/.bashcustom/.{aliases,colors,commands,export,functions,osx,svnextras,work,mine}; do
	[ -r "$file" ] && source "$file"
done
unset file

#Prompt 
#PS1="[\[\033[36m\]\u\[\033[37m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]]$ "
PS1="🍕 \[$(tput setaf 2)\] \W \[$(tput setaf 3)\]$ \[$(tput setaf 7)\]"

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}


#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home

export EC2_HOME="/usr/bin/ec2-api-tools-1.6.8.0/"
export PATH=$PATH:$EC2_HOME/bin
export AWS_ACCESS_KEY=AKIAJRDD7SCAGXY6DHLQ
export AWS_SECRET_KEY=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 

export TWILIO_ACCOUNT_SID=ACdcbc978cc4ccab97d42e78746ab84286
export TWILIO_AUTH_TOKEN=6addc9603fbb8087559a529996dc789a

export testNumber='+19173650744'

#RAM FOR MAVEN
export MAVEN_OPTS="-XX:MaxPermSize=1024m -Dmaven.test.skip=true";
