#! /bin/sh

pyenv install 2.7.11
pyenv install 3.4.4

pyenv virtualenv 2.7.11 neovim2
pyenv virtualenv 3.4.4 neovim3

pyenv rehash
source ~/.bash_profile

pyenv activate neovim2
pip install --upgrade pip
pip install neovim

pyenv activate neovim3
pip install --upgrade pip
pip install neovim flake8

mkdir $HOME/bin
ln -sf `pyenv which flake8` $HOME/bin/flake8

pyenv local system

