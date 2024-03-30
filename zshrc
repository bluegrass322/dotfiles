# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

setopt AUTO_CD

autoload -Uz colors && colors
autoload -Uz compinit && compinit

export PATH="$HOME/.asdf/shims:$PATH"
source $HOME/.cargo/env

eval "$(sheldon source)"
eval "$(starship init zsh)"

alias gitconfig='vim ~/.gitconfig'

# Docker
alias compose='docker-compose'
alias docker-containers='docker container ls'

# Shell
alias reload-shell='exec $SHELL -l'
alias sheldonconfig='EDITOR=nvim sheldon edit'
alias zshconfig='vim ~/.zshrc'

[ -f ~/dotfiles/zshrc.local ] && source ~/dotfiles/zshrc.local
