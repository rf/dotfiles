.PHONY: dotfiles packages-debian ohmyzsh debian

THIS_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

debian: packages-debian dotfiles ohmyzsh

dotfiles:
	rm -f ~/.zshrc
	ln -F -s $(THIS_DIR)/.zshrc ~/.zshrc
	ln -F -s $(THIS_DIR)/.zsh.d ~/.zsh.d
	mkdir -p ~/.config
	ln -F -s $(THIS_DIR)/.vim ~/.config/nvim
	ln -F -s $(THIS_DIR)/.gitconfig ~/.gitconfig
	ln -F -s $(THIS_DIR)/.tmux.conf ~/.config/.tmux.conf
	brew install --cask font-iosevka
	ln -F -s $(THIS_DIR)/kitty.conf ~/.config/kitty/kitty.conf

packages-debian:
	sudo apt install tmux neovim build-essential git zsh

ohmyzsh:
	sh -c "`curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh`"
	cp rf.zsh-theme ~/.oh-my-zsh/themes/
	git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
