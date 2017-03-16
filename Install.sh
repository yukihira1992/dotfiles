#!/bin/sh

ln -fs ~/dotfiles/.vimrc ~/.vimrc
ln -fs ~/dotfiles/.vim/ ~/.vim
ln -fs ~/dotfiles/.bash_profile ~/.bash_profile
ln -fs ~/dotfiles/.bashrc ~/.bashrc

rm -rf ~/dotfiles/.vim/bundle/*
git clone https://github.com/Shougo/neobundle.vim .vim/bundle/neobundle.vim/
