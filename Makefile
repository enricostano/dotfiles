DIRECTORY=~/dotfiles

install:
	ln -fs $(DIRECTORY)/Xresources ~/.Xresources
	ln -fs $(DIRECTORY)/vim ~/.vim
	ln -fs $(DIRECTORY)/vim/vimrc ~/.vimrc
	ln -fs $(DIRECTORY)/gitconfig ~/.gitconfig
	ln -fs $(DIRECTORY)/fish/functions ~/.config/fish
	ln -fs $(DIRECTORY)/i3/config ~/.i3/config
	ln -fs $(DIRECTORY)/i3/i3status.conf ~/.i3status.conf

.PHONY: install
