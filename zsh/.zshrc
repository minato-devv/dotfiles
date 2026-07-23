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

autoload -Uz compinit vcs_info add-zsh-hook
compinit

add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats ' (%S [%b] %u%c)'
zstyle ':vcs_info:git:*' actionformats ' (%S|%b %a%u%c)'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '*'

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' list-dirs-first true

export PS1='%d${vcs_info_msg_0_} %# '
export RPROMPT='%h'

alias ei='${EDITOR} $ZDOTDIR/.zshrc'
alias ev='${EDITOR} $HOME/.zshenv'

alias ci='cat $ZDOTDIR/.zshrc'
alias cv='cat $HOME/.zshenv'

alias si='source $ZDOTDIR/.zshrc'
alias sv='source $HOME/.zshenv'
alias z='exec zsh'

alias ls='ls -AGCh'
alias cat='bat'
alias vim='nvim'
alias e='$EDITOR'

alias ff='fastfetch'
alias size='du -sh * | sort -hr'
alias top='top -stats pid,mem,cpu,command,state,time,power -o -mem -s 2 -U user'

alias fm-serve='stdbuf -oL -eL fm serve >> ${HOME}/logs/fm.log 2>&1 &'
alias fm-kill='pkill -f "fm serve"'

alias pysour='source .venv/bin/activate'
alias pyvenv='python3 -m venv .venv && pysour'

alias com='fabric -p create_git_diff_commit'

alias bbl='brew bundle list --file ~/.homebrew/Brewfile'
alias bbd='brew bundle dump --force --file ~/.homebrew/Brewfile'

alias pi='container run -it  --rm -v "$PWD:/home/node/workspace" -v ~/Dev/pi-container/pi-agent:/home/node/.pi/agent pi-coding-agent:local'

alias path='print -l $path'
alias fpath='print -l $fpath'
alias fd='fd -H'

pc() { 
	realpath "$1" | tr -d '\n' | pbcopy 
	echo "Copied location of $1 to clipboard"
}

backupdir() {
	local src="$1"
	local dest="${2:-$HOME/Library/Mobile Documents/com~apple~CloudDocs/Documents/backups}"
	local name="$(basename "$src")-backup-$(date +%F-%H%M%S)"

	mkdir -p "$dest" || return 1
	cp -a "$src" "$dest/$name"
	echo "Backup created: $dest/$name"
}
