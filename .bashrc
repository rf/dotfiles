TERM=xterm-256color

[ -z "$PS1" ] && return # If not running interactively, don't do anything

HISTCONTROL=ignoreboth

shopt -s histappend   # append to history file
shopt -s checkwinsize # ensure window size is correct

LIGHTRED='\e[1;31m'
GREEN='\e[32m'
YELLOW='\e[1;33m'
LIGHTBLUE="\e[1;34m"
DARKGRAY='\e[0;37m'
LIGHTGREEN='\e[1;32m'
GOLD='\e[33m'
NC='\e[m'   # reset colors

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}


PS1="\n\@ $LIGHTRED \h $GOLD \w $LIGHTGREEN \`parse_git_branch\`\n$NC\\$ "

if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

if [ -f ~/.bash_local ]; then
   . ~/.bash_local
fi

DEBEMAIL=rfrank.nj@gmail.com
DEBFULLNAME="Russell Frank"
export DEBEMAIL DEBFULLNAME

PATH=~/.bin/:~/node_modules/.bin/:/opt/local/bin/:$PATH

export EDITOR=vim

if [ -f ~/.nvm/nvm.sh ]; then
   . ~/.nvm/nvm.sh
fi
