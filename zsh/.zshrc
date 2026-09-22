export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

setopt auto_cd
setopt glob_dots
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

autoload -Uz add-zsh-hook

zmodload zsh/complist
autoload -Uz compinit  && compinit
# autoload -Uz colors && colors
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' file-sort date
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%U%d%u%b'
zstyle ':completion:*' list-dirs-first true

bindkey -e
autoload -Uz edit-command-line && zle -N edit-command-line
bindkey '^X^E' edit-command-line

for i in $ZDOTDIR/functions/*(.N); do autoload -Uz $i; done
# for i in $ZDOTDIR/plugins/*(.N); do source $i; done

# for i in $ZDOTDIR/conf.d/*(.N); do source $i; done
source $ZDOTDIR/conf.d/.aliases
source $ZDOTDIR/conf.d/.git_aliases
# source $ZDOTDIR/conf.d/.transient_prompt
# source $ZDOTDIR/conf.d/.vcs_info
# source $ZDOTDIR/conf.d/.bindkey
export PROMPT="%# "
