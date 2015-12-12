alias savesshenv='env | grep SSH | sed s/=/=\"/ | sed s/$/\"/ > ~/.ssh/env'
alias restoresshenv='source ~/.ssh/env'

alias ag="ag --pager less\ -R "

alias dad="supervisorctl"

platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
    alias listening='sudo netstat -t -p --listening'
elif [[ "$unamestr" == 'Darwin' ]]; then
    alias listening='lsof -iTCP -sTCP:LISTEN -P -n'
fi

alias npmpub='npm --registry=http://registry.npmjs.org/ publish'

function sesh() {
    tmux attach -t $1 || tmux new -s $1
}

alias seshes='tmux list-sessions'
