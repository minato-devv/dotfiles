zmodload zsh/zprof

mkdir -p "$XDG_CONFIG_HOME" "$ZDOTDIR" "$XDG_STATE_HOME/zsh" "$XDG_CACHE_HOME/zsh" "$XDG_DATA_HOME"

export HISTFILE="$XDG_STATE_HOME/zsh/history"
export CLICOLOR=1
export HISTSIZE=10000
export SAVEHIST=10000

setopt auto_cd
setopt auto_pushd
setopt glob_dots
setopt glob_subst
setopt extended_glob
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_find_no_dups
setopt interactive_comments
setopt prompt_subst

autoload -Uz add-zsh-hook
# autoload -Uz vcs_info
# add-zsh-hook precmd vcs_info
#
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' unstagedstr ' *'
# zstyle ':vcs_info:*' stagedstr '+'
# zstyle ':vcs_info:git:*' formats ' [%b%u%c]'
# export PROMPT='%~${vcs_info_msg_0_} %# '

zmodload zsh/complist
autoload -Uz compinit && compinit -C -d "$XDG_CACHE_HOME/zsh/.zcompdump"

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%S%d (%n)%s'
zstyle ':completion:*' file-sort access

for i in $ZDOTDIR/functions/*(.N:t); do autoload -Uz $i; done
for i in $ZDOTDIR/conf.d/*(.N); do source $i; done


# autoload -Uz zrecompile
# zrecompile -p $ZDOTDIR/.zshrc

# autoload -Uz zsh_directory_name_generic zdn_wrapper 
# add-zsh-hook -U zsh_directory_name zdn_wrapper
# zdn_wrapper() {
# 	local -A zdn_top=(
# 	)
# 	zsh_directory_name_generic "$@"
# }

autoload -Uz zmv
autoload -Uz zed
autoload -Uz zargs
zmodload zsh/mathfunc
zmodload zsh/datetime

hash -d cg=~/.config
hash -d vl=/Volumes
hash -d zsh=$ZDOTDIR
hash -d dl=~/Downloads
hash -d dc=~/Documents
hash -d sc=~/Pictures/Screenshots
hash -d git=~/git
hash -d dot=~/git/dotfiles
hash -d xc=~/XC

autoload -Uz add-zle-hook-widget
# clear-screen-finish() {
# 	if [[ -z $BUFFER ]]; then
# 		zle clear-screen
# 	fi
# }
# zle -N clear-screen-finish
# add-zle-hook-widget zle-line-finish clear-screen-finish

bindkey -N simple .safe

for char in {A..Z}; do
    bindkey -M simple "^$char" undefined-key
done

bindkey -M simple "^@" undefined-key
bindkey -M simple "^[" undefined-key
bindkey -M simple "^\\" undefined-key

stty -ixon
bindkey -M simple "^Q" push-line

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search 
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M simple "^[[A" up-line-or-beginning-search
bindkey -M simple "^[[B" down-line-or-beginning-search

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M simple '^X^E' edit-command-line

bindkey -M simple "^M" accept-line
bindkey -M simple "^J" accept-line
bindkey -M simple "^A" beginning-of-line
bindkey -M simple "^E" end-of-line
bindkey -M simple "^I" expand-or-complete
bindkey -M simple "^K" kill-line
bindkey -M simple "^L" clear-screen
bindkey -M simple "^N" down-line-or-history
bindkey -M simple "^P" up-line-or-history
bindkey -M simple "^R" history-incremental-search-backward
bindkey -M simple "^U" kill-whole-line
bindkey -M simple "^V" quoted-insert
bindkey -M simple "^X*" expand-word
bindkey -M simple "^[[200~" bracketed-paste
bindkey -M simple "^?" backward-delete-char
bindkey -M simple "^[[C" forward-char
bindkey -M simple "^[[D" backward-char

bindkey -A simple main

zprof
