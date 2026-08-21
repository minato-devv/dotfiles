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

zmodload zsh/complist
autoload -Uz compinit  && compinit
autoload -Uz colors && colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' file-sort date
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%U%d%u%b'
# zstyle ':completion:*' list-dirs-first true

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
	local ahead_count behind_count untracked_count staged_count unstaged_count

	ahead_count="$(git rev-list --count @{upstream}..HEAD 2>/dev/null)"
	behind_count="$(git rev-list --count HEAD..@{upstream} 2>/dev/null)"
	[[ $ahead_count -gt 0 ]] && git_aheadbehind+=("↑${ahead_count}")
	[[ $behind_count -gt 0 ]] && git_aheadbehind+=("↓${behind_count}")
	[[ -n "${git_aheadbehind}" ]] && git_items+=("${(j::)git_aheadbehind}")

	staged_count="$(git diff --cached --numstat | wc -l | tr -d ' ')"
	unstaged_count="$(git diff --name-only | wc -l | tr -d ' ')"
	[[ "${staged_count}" -gt 0 ]] && git_items+=("+${staged_count}")
	[[ "${unstaged_count}" -gt 0 ]] && git_items+=("*${unstaged_count}")

	untracked_count="$(git status --porcelain | /usr/bin/grep -c '??')"
	[[ $untracked_count -gt 0 ]] && git_items+=("?${untracked_count}")

	hook_com[misc]="[${(j: :)git_items}]"
}
zstyle ':vcs_info:git*+post-backend:*' hooks git-format-array

# UPTIME="$(uptime | sed -E 's/^.*up ([^,]*).*/\1/')"
# BATT="$(pmset -g batt | \grep -Eo '\d+%' | sed -E 's/%/%%/')"
# DISK="$(df -h / | tail -1 | awk "{print \$4}" | head -1)"
# MEM="$(vm_stat | awk "/Pages free/ {print \$3}" | sed -E 's/\.//')"
export PROMPT='[%D{%d/%m/%y}] %n@%m %~${vcs_info_msg_0_} '
source "$ZDOTDIR/.aliases"
bindkey -e
autoload -Uz edit-command-line && zle -N edit-command-line
bindkey '^e' edit-command-line
for i in $ZDOTDIR/plugins/*(.N); do source $i; done
