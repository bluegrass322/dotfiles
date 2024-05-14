HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
HIST_STAMPS="yyyy-mm-dd"

setopt AUTO_CD
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

bindkey -e

autoload -Uz colors && colors
autoload -Uz compinit && compinit

eval "$(mise activate zsh)"
eval "$(sheldon source)"
eval "$(starship init zsh)"

source $HOME/.cargo/env

# alias cat='bat'
# alias grep='rg'
alias -g @g='| grep'

alias ls='exa'
alias lsa='ls -a'
alias lsl='ls -l'
alias lsla='ls -la'

alias compose='docker-compose'
alias d-containers='docker container ls'

alias ngup='ngrok http 3000'

alias run-cop='bundle exec rubocop -a'
alias run-spec='bundle exec rspec'

alias reload-shell='exec $SHELL -l'

alias gitconfig='nvim ~/.gitconfig'
alias zshconfig='nvim ~/.zshrc'
alias sheldonconfig='EDITOR=nvim sheldon edit'

git_review() {
  echo 'Type PR number:' && read number;
  echo 'Type branch name:' && read br_name;

  git fetch origin pull/${number}/head:${br_name}
  git switch ${br_name}
}

replace() {
  sed -i'.bak' "s/$1/$2/g" $3
}

replace_all() {
  # find $3 | xargs sed -i'.bak' "s/$1/$2/g"
}

[ -f ~/dotfiles/zshrc.local ] && source ~/dotfiles/zshrc.local

# $ touch example
# $ test -e example && echo "foo"
# foo
#
# $ test -e notafile && echo "foo"
#

# if [ -f /var/log/messages ]
# then
#  echo "File exists."
# fi
