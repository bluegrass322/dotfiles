# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

autoload -Uz colors && colors
autoload -Uz compinit && compinit

source $HOME/.cargo/env

eval "$(sheldon source)"
eval "$(starship init zsh)"

alias gitconfig='vim ~/.gitconfig'

# Docker
alias compose='docker-compose'
alias docker-containers='docker container ls'
alias docker-lint='hadolint'

# Shell
alias reload-shell='exec $SHELL -l'
alias sheldonconfig='EDITOR=vim sheldon edit'
alias zshconfig='vim ~/.zshrc'

[ -f ./.zshrc.local ] && source ./.zshrc.local
