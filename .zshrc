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
bindkey "^R" history-incremental-search-backward

alias chrome='"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"'


# added by newengsetup
export EDITOR=vim
export UBER_HOME="$HOME/Uber"
export UBER_OWNER="rf@uber.com"
export UBER_LDAP_UID="rf"
export VAGRANT_DEFAULT_PROVIDER=aws

path+=('$HOME/bin')

[ -s "/usr/local/bin/virtualenvwrapper.sh" ] && . /usr/local/bin/virtualenvwrapper.sh
[ -s "$HOME/.nvm/nvm.sh" ] && . $HOME/.nvm/nvm.sh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

_sync_dir () {
    cmd=$1
    shift
    new_directory=$(boxer sync_dir $@)
    if [ "$?" -eq "0" ]; then
        $cmd $new_directory
    else
        echo "$new_directory"
    fi
}
cdsync () {
    _sync_dir cd $@
}
editsync () {
    _sync_dir $EDITOR $@
}
opensync () {
    _sync_dir open @
}
