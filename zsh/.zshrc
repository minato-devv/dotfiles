source "$XDG_CONFIG_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY

setopt COMPLETE_IN_WORD
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
setopt CHASE_LINKS
setopt PROMPT_SUBST
setopt CDABLE_VARS

bindkey -e

autoload -Uz compinit vcs_info add-zsh-hook edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
compinit

add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats ' (%b [%u%c])'
zstyle ':vcs_info:git:*' actionformats ' (%b [%a%u%c])'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '*'

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' list-dirs-first true

export PS1='[%h] %~${vcs_info_msg_0_} %# '
source "$ZDOTDIR/.aliases"
