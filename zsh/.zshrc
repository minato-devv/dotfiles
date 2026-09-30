if [[ -o interactive ]]; then
    mkdir -p "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME"
fi

export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

setopt auto_cd
setopt glob_dots
setopt glob_subst
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
setopt ignore_eof

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
zstyle ':completion:*:*:(vim|nvim|cat):*' file-patterns '*(-.)'

for i in $ZDOTDIR/functions/*(.N); do autoload -Uz $i; done
for i in $ZDOTDIR/plugins/*(.N); do source $i; done
# for i in $ZDOTDIR/conf.d/*(.N); do source $i; done

source $ZDOTDIR/conf.d/.aliases
source $ZDOTDIR/conf.d/.git_aliases
source $ZDOTDIR/conf.d/.mac_aliases
# source $ZDOTDIR/conf.d/.bindkey
# source $ZDOTDIR/conf.d/.transient_prompt
# source $ZDOTDIR/conf.d/.vcs_info
# export PROMPT="%# "

bindkey -e

autoload -Uz add-zsh-hook zsh_directory_name_generic zdn_wrapper 
add-zsh-hook -U zsh_directory_name zdn_wrapper
zdn_wrapper() {
	local -A zdn_top=(
		g	$HOME/git/:second1
		c	$HOME/.config/:second2
		v	/Volumes
	)

	local -A second1=()
	for r in $HOME/git/*(-/NOc); do
		local k=${${r:t}[1]} c=1
		while [[ -n ${second1[$k]} ]]; do
			k="${${r:t}[1]}$((++c))"
		done
		second1[$k]=${r:t}
	done

	local -A second2=()
	for r in $HOME/.config/*(-/NOc); do
		local k=${${r:t}[1]} c=1
		while [[ -n ${second2[$k]} ]]; do
			k="${${r:t}[1]}$((++c))"
		done
		second2[$k]=${r:t}
	done
	second2[z]="zsh/:second3"

	local -A second3=()
	for r in $HOME/.config/zsh/*(-/NOc); do
		local k=${${r:t}[1]} c=1
		while [[ -n ${second3[$k]} ]]; do
			k="${${r:t}[1]}$((++c))"
		done
		second3[$k]=${r:t}
	done
	zsh_directory_name_generic "$@"
}
