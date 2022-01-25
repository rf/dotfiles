.PHONY: dotfiles packages-debian ohmyzsh debian

THIS_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

debian: packages-debian dotfiles ohmyzsh

dotfiles:
	rm -f ~/.zshrc
	ln -s $(THIS_DIR)/.zshrc ~/.zshrc
	ln -s $(THIS_DIR)/.zsh.d ~/.zsh.d
	mkdir -p ~/.config
	ln -s $(THIS_DIR)/.vim ~/.config/nvim
	ln -s $(THIS_DIR)/.gitconfig ~/.gitconfig
	ln -s $(THIS_DIR)/.tmux.conf ~/.config/.tmux.conf

packages-debian:
	sudo apt install tmux neovim build-essential git zsh

ohmyzsh:
	sh -c "`curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g'`"
	cp rf.zsh-theme ~/.oh-my-zsh/themes/
