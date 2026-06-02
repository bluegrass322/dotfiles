export LANG=ja_JP.UTF-8

HISTFILE=~/.histfile
HISTSIZE=10_000
SAVEHIST=10_000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
HIST_STAMPS="yyyy-mm-dd"

setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt NO_HIST_BEEP
setopt SHARE_HISTORY

setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_GLOB
setopt NO_BEEP
setopt PUSHD_IGNORE_DUPS

setopt PRINT_EIGHT_BIT

zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
zstyle ":completion:*:processes" command "ps x -o pid,s,args"

[ -f ~/dotfiles/zshrc.local ] && source ~/dotfiles/zshrc.local

autoload -Uz compinit && compinit
autoload -Uz colors && colors
bindkey -e

eval "$(mise activate zsh)"

