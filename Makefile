DIRECTORY=~/dotfiles

install: setup
	ln -fsn $(DIRECTORY)/bash/bashrc ~/.bashrc
	ln -fsn $(DIRECTORY)/systemd ~/.config/systemd
	ln -fsn $(DIRECTORY)/i3/config ~/.config/i3
	ln -fsn $(DIRECTORY)/i3/i3status.conf ~/.i3status.conf
	ln -fsn $(DIRECTORY)/nvim ~/.config/nvim
	ln -fsn $(DIRECTORY)/gitconfig ~/.gitconfig

setup:
	git submodule init
	git submodule update

.PHONY: install
