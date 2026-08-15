export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000
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

autoload -Uz compinit  && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
# zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' file-sort date
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%U%d%u%b'

autoload -Uz fetch_temps
# export PERIOD=10
# prompt_temps() { fetch_temps all; }
# add-zsh-hook periodic prompt_temps

autoload -Uz vcs_info 
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats ' %m'
zstyle ':vcs_info:*' actionformats ' %m (%a)'

+vi-git-format-array() {
	local -a git_items git_aheadbehind
    git_items+=("${hook_com[branch]}")
    local ahead_count behind_count untracked_count

    ahead_count=$(git rev-list --count @{upstream}..HEAD 2>/dev/null)
    behind_count=$(git rev-list --count HEAD..@{upstream} 2>/dev/null)
    [[ $ahead_count -gt 0 ]] && git_aheadbehind+=("↑${ahead_count}")
    [[ $behind_count -gt 0 ]] && git_aheadbehind+=("↓${behind_count}")
	[[ -n "${git_aheadbehind}" ]] && git_items+=("${(j::)git_aheadbehind}")

    [[ -n "${hook_com[staged]}" ]] && git_items+=("+${hook_com[staged]}")
    [[ -n "${hook_com[unstaged]}" ]] && git_items+=("*${hook_com[unstaged]}")

	untracked_count="$(git status --porcelain | /usr/bin/grep -c '??')"
	[[ $untracked_count -gt 0 ]] && git_items+=("?${untracked_count}")

	hook_com[misc]="[${(j: :)git_items}]"
}
zstyle ':vcs_info:git*+post-backend:*' hooks git-format-array

export PS1='%~${vcs_info_msg_0_} %# '
source "$ZDOTDIR/.aliases"
bindkey -v
source "$ZDOTDIR/plugins/git.plugin.zsh"
