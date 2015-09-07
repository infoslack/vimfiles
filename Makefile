SHELL := /bin/bash

install: setup

setup:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall
