TERM=xterm-256color

[ -z "$PS1" ] && return # If not running interactively, don't do anything

HISTCONTROL=ignoreboth

shopt -s histappend   # append to history file
shopt -s checkwinsize # ensure window size is correct

function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

LIGHTRED='\e[1;31m'
GREEN='\e[32m'
YELLOW='\e[1;33m'
LIGHTBLUE="\e[1;34m"
DARKGRAY='\e[37m'
LIGHTGREEN='\e[1;32m'
GOLD='\e[33m'
NC='\e[m'   # reset colors

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1=""
PS1="$PS1$LIGHTRED\h "                          # hostname
PS1="$PS1$GOLD\w "                              # path
PS1="$PS1$LIGHTGREEN\$(parse_git_branch) "
PS1="\n\@ $PS1\n$DARKGRAY\\$ $NC"                      # $ prompt

if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

if [ -f ~/.bash_local ]; then
   . ~/.bash_local
fi

DEBEMAIL=rfrank.nj@gmail.com
DEBFULLNAME="Russell Frank"
export DEBEMAIL DEBFULLNAME

PATH=$PATH:~/.bin/

export EDITOR=vim

if [ -f ~/.nvm/nvm.sh ]; then
   . ~/.nvm/nvm.sh
fi
