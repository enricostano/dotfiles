DIRECTORY=~/dotfiles

install:
	ln -fs $(DIRECTORY)/vim/vimrc ~/.vimrc

.PHONY: install
