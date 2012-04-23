TERM=xterm-256color

[ -z "$PS1" ] && return # If not running interactively, don't do anything

HISTCONTROL=ignoreboth

shopt -s histappend   # append to history file
shopt -s checkwinsize # ensure window size is correct

function EXT_COL () { echo -ne "\[\033[38;5;$1m\]"; }

set -o vi

export CLICOLOR=true

NC='\e[m'   # reset colors

USERCOL=`EXT_COL 23`
ATCOL=`EXT_COL 24`
HOSTCOL=`EXT_COL 25`
PATHCOL=`EXT_COL 115`
BRANCHCOL=`EXT_COL 216`
RETURNCOL=`EXT_COL 9`

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

is_nonzero_ret() {
   printf '%.*s' $? $?
}

nonzero_return() {
   RETVAL=$?
   [ $RETVAL -eq 1 ] && echo " ⏎ $RETVAL "
}

PS1="\n\@ $USERCOL \u $ATCOL@ $HOSTCOL\h $PATHCOL \w $RETURNCOL\`nonzero_return\`$BRANCHCOL \`parse_git_branch\` $NC\n\\$ "

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
