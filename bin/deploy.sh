#!/bin/sh

cd ../
for file in .??*
do
    [[ "$file" == ".DS_Store" ]] && continue
    [[ "$file" == ".git" ]] && continue
    [[ "$file" == ".gitmodule" ]] && continue
    ln -s $PWD"/"$file $HOME
done
