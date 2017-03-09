#!/bin/sh

ln -fs ~/dotfiles/.vimrc ~/.vimrc
ln -fs ~/dotfiles/.vim/ ~/.vim

rm -rf ~/dotfiles/.vim/bundle/*
git clone https://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim/
