DIRECTORY=~/dotfiles

install:
	ln -fs $(DIRECTORY)/vim ~/.vim
	ln -fs $(DIRECTORY)/vim/vimrc ~/.vimrc
	ln -fs $(DIRECTORY)/gitconfig ~/.gitconfig
	ln -fs $(DIRECTORY)/fish/functions ~/.config/fish

.PHONY: install
