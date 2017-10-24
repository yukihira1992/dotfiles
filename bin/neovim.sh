#! /bin/sh

pyenv install 2.7.11
pyenv install 3.4.4

pyenv virtualenv 2.7.11 neovim2
pyenv virtualenv 3.4.4 neovim3

pyenv activate neovim2
pip install neovim

pyenv activate neovim3
pip install neovim
pip install flake8

mkdir ~/bin
ln -sf `pyenv which flake8` ~/bin/flake8

