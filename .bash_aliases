alias savesshenv='env | grep SSH | sed s/=/=\"/ | sed s/$/\"/ > ~/.ssh/env'
alias restoresshenv='source ~/.ssh/env'

alias playdoh="node0.10 ~/uber/playdoh/cli/cli.js"

alias ag="ag --pager less\ -R "

alias dad="supervisorctl"

alias sesh='screen -UdRS'
alias seshx='screen -UxS'
alias seshes='screen -ls'

platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
    alias listening='sudo netstat -t -p --listening'
elif [[ "$unamestr" == 'Darwin' ]]; then
    alias listening='lsof -iTCP -sTCP:LISTEN -P -n'
fi

alias npmpub='npm --registry=http://registry.npmjs.org/ publish'
