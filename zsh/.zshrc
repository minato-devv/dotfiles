export HISTFILE="$XDG_STATE_HOME/zsh/history"
export CLICOLOR=1
export HISTSIZE=10000
export SAVEHIST=10000

setopt auto_cd
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

autoload -Uz vcs_info add-zsh-hook
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats ' [%b%u%c]'

zmodload zsh/complist
autoload -Uz compinit  && compinit

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

for i in $ZDOTDIR/functions/*(.N:t); do autoload -Uz $i; done
for i in $ZDOTDIR/plugins/*(.N); do source $i; done
for i in $ZDOTDIR/conf.d/*(.N); do source $i; done

export PROMPT='%~${vcs_info_msg_0_} %# '

bindkey -e

autoload -Uz zsh_directory_name_generic zdn_wrapper 
add-zsh-hook -U zsh_directory_name zdn_wrapper
zdn_wrapper() {
	local -A zdn_top=(
		g	$HOME/git
		c	$HOME/.config
		v	/Volumes
	)
	zsh_directory_name_generic "$@"
}
