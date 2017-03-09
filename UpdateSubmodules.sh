#!/bin/sh

cd .vim/bundle/jedi-vim/
git submodule init
git submodule update
cd ../../../
git submodule init
git submodule update

