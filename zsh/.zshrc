# `history envs {{{
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
# }}}

# `opts {{{
setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_find_no_dups
setopt hist_verify

setopt extended_glob null_glob
setopt complete_in_word
setopt interactive_comments
setopt no_beep
setopt chase_links
setopt prompt_subst
setopt cdable_vars
setopt ignore_eof
# }}}

# `modules & completion {{{
autoload -Uz compinit vcs_info add-zsh-hook edit-command-line
add-zsh-hook precmd vcs_info
zle -N edit-command-line
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' list-dirs-first true
# }}}

# `prompt {{{
zstyle ':vcs_info:git:*' formats ' (%b [%u%c])'
zstyle ':vcs_info:git:*' actionformats ' (%b [%a%u%c])'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '*'
export PS1='[%? | %!] %~${vcs_info_msg_0_} %# '
# }}}

# `aliases & keybinds {{{
source "$ZDOTDIR/.aliases"
source "$ZDOTDIR/.bindkey"
source "$ZDOTDIR/plugins/git.zsh"
# }}}
