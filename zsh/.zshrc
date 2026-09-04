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

	hook_com[misc]="⎇ ${(j: :)git_items}"
}
zstyle ':vcs_info:git*+post-backend:*' hooks git-format-array

typeset -g _prompt_full=$'%n@%m %B%~%b${vcs_info_msg_0_}\n❯ '
typeset -g _transient_prompt='❯ '
# typeset -g _prompt_full=$'%F{13}%n@%m%f %F{6}%B%~%b%f%F{14}${vcs_info_msg_0_}%f\n%(?.%F{12}❯%f .%F{9}❯%f )'
# typeset -g _transient_prompt='%(?.%F{12}❯%f .%F{9}❯%f )'
typeset -g _rprompt='%*'
_collapse_prompt() {
	[[ "$PROMPT" == "$_transient_prompt" ]] && return
	[[ -o zle ]] || return
	PROMPT="$_transient_prompt"
	RPROMPT=""
	zle reset-prompt
	zle -R
}
_restore_prompt() {
	PROMPT="$_prompt_full"
	RPROMPT="$_rprompt"
}
autoload -Uz add-zle-hook-widget
add-zle-hook-widget line-finish _collapse_prompt
add-zsh-hook precmd _restore_prompt
TRAPINT() {
	[[ -o interactive ]] && _collapse_prompt
	return $((128 + $1))
}
PROMPT="$_prompt_full"

source "$ZDOTDIR/.aliases"
bindkey -e
autoload -Uz edit-command-line && zle -N edit-command-line
bindkey '^e' edit-command-line
for i in $ZDOTDIR/plugins/*(.N); do source $i; done
