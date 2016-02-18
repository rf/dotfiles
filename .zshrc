# Path to your oh-my-zsh installation.
export ZSH=/Users/russfrank/.oh-my-zsh

ZSH_THEME="juanghurtado"

plugins=(git)

export PATH="/Users/russfrank/.nvm/v0.10.32/bin:/Users/russfrank/uber/FlameGraph:/Users/russfrank/bin:/Users/russfrank/node_modules/.bin:/opt/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

source $ZSH/oh-my-zsh.sh

setopt no_share_history

for part in $HOME/.zsh.d/??_*; do
    source $part
done

bindkey -v
