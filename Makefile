DIRECTORY=~/dotfiles

install: setup
	ln -fsn $(DIRECTORY)/Xresources ~/.Xresources
	ln -fsn $(DIRECTORY)/nvim ~/.config/nvim
	ln -fsn $(DIRECTORY)/gitconfig ~/.gitconfig
	ln -fsn $(DIRECTORY)/fish/functions ~/.config/fish
	ln -fsn $(DIRECTORY)/i3/config ~/.config/i3
	ln -fsn $(DIRECTORY)/i3/i3status.conf ~/.i3status.conf
	ln -fsn $(DIRECTORY)/systemd ~/.config/systemd

setup:
	git submodule init
	git submodule update

.PHONY: install
