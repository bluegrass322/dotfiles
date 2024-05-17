#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file=./Brewfile

DOT_DIR="$HOME/dotfiles"
for file in .gitconfig, .zshrc, .zprofile;
do
    ln -snf $DOT_DIR/"$file" $HOME/".$file"
    echo "Linked .$file"
done

# symbolic link
ln -s ~/dotfiles/nvim ~/.config/nvim
