# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

source $HOME/.cargo/env
eval "$(sheldon source)"
eval "$(starship init zsh)"

