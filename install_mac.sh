#!/bin/bash
DOT_DIR="$HOME/dotfiles"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

for file in .gitconfig, .zshrc;
do
    ln -snf $DOT_DIR/"$file" $HOME/".$file"
    echo "Created .$file"
done

brew install asdf
echo "Installed $(asdf --version)"

brew install git
echo "Installed $(git version)"

brew install neovim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
# symbolic link
echo "Installed $(nvim --version)"

brew install ngrok/ngrok/ngrok
echo "Installed $(ngrok -v)"

brew install starship
echo "Installed $(starship -V)"
