#! /bin/bash

echo -e "\n##### Setup dotfiles. #####"
for file in .??*
do
    [[ "$file" == ".DS_Store" ]] && continue
    [[ "$file" == ".git" ]] && continue
    [[ "$file" == ".gitmodule" ]] && continue
    ln -s $PWD"/"$file $HOME
done

echo -e "\n##### Install Homebrew. #####"
if ![ type brew > /dev/null 2>&1 ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew bundle install

echo -e "\n##### Setup fish shell. #####"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher
