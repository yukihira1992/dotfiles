#! /bin/bash

for file in dotfiles/.??*
do
    if [ -d $file ] ; then
        continue
    fi
    ln -si "$(realpath $file)" $HOME
done

mkdir -p $HOME/.config
for file in dotfiles/.config/??*
do
    ln -si "$(realpath $file)" $HOME/.config/
done

exit 0

