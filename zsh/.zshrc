export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
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

autoload -Uz compinit  && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' list-dirs-first true

# autoload -Uz fetch_temps
# export PERIOD=10
# prompt_temps() { fetch_temps all; }
# add-zsh-hook periodic prompt_temps

autoload -Uz vcs_info 
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats ' (%b%c%u)'
zstyle ':vcs_info:*' actionformats ' (%b%c%u%a)'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '*'
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true' ]] && \
		git status --porcelain | /usr/bin/grep -q '??'; then
        hook_com[unstaged]+='?'
	else
		hook_com[unstaged]+='='
    fi
}
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

export PS1='%~${vcs_info_msg_0_} %# '
source "$ZDOTDIR/.aliases"
bindkey -v
source "$ZDOTDIR/plugins/git.plugin.zsh"
