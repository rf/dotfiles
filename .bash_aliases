alias savesshenv='env | grep SSH | sed s/=/=\"/ | sed s/$/\"/ > ~/.ssh/env'
alias restoresshenv='source ~/.ssh/env'

alias playdoh="node0.10 ~/uber/playdoh/cli/cli.js"

alias ag="ag --pager less\ -R "

alias dad="supervisorctl"

alias sesh='screen -UdRS'
alias seshx='screen -UxS'
alias seshes='screen -ls'

