DIRECTORY=~/dotfiles

install: setup
	ln -fsn $(DIRECTORY)/Xresources ~/.Xresources
	ln -fsn $(DIRECTORY)/nvim ~/.config/nvim
	ln -fsn $(DIRECTORY)/gitconfig ~/.gitconfig
	ln -fsn $(DIRECTORY)/fish/functions ~/.config/fish
	ln -fsn $(DIRECTORY)/i3/config ~/.i3/config
	ln -fsn $(DIRECTORY)/i3/i3status.conf ~/.i3status.conf

setup:
	git submodule init
	git submodule update

.PHONY: install
