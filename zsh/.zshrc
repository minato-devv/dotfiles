eval "$(/opt/homebrew/bin/brew shellenv)"

export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

setopt EXTENDED_HISTORY 
setopt APPEND_HISTORY 
setopt INC_APPEND_HISTORY 
setopt SHARE_HISTORY 
setopt HIST_IGNORE_DUPS 
setopt HIST_IGNORE_SPACE 
setopt HIST_NO_STORE 
setopt CORRECT 
setopt COMPLETE_IN_WORD
setopt AUTO_PUSHD
setopt CHASE_LINKS

autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' file-list all
zstyle ':completion:*' file-sort change

# export PROMPT='%w %3~ »»» '

# Editing
alias ei='${EDITOR} $ZDOTDIR/.zshrc'
alias ev='${EDITOR} $HOME/.zshenv'

# Viewing
alias ci='cat $ZDOTDIR/.zshrc'
alias cv='cat $HOME/.zshenv'
# Sourcing
alias z='exec zsh -li'

alias ls='eza -A --group-directories-first --hyperlink always --icons always'
alias cat='bat'
alias vim='nvim'

alias ff='fastfetch'
alias tree='fd -d 2'
alias du='du -sh'
alias size='du -sh * | sort -hr'
alias top='top -stats pid,mem,cpu,command,state,time,power -o -mem -s 2 -U user'

alias fm-serve='stdbuf -oL -eL fm serve >> ${HOME}/logs/fm.log 2>&1 &'
alias fm-kill='pkill -f "fm serve"'

alias pysour='source .venv/bin/activate'
alias pyvenv='python3 -m venv .venv && pysour'

alias vencord='${HOME}/Dev/Installer/vencordinstaller'

alias fcommit='fabric -p create_git_diff_commit'

alias bbl='brew bundle list --file ~/.homebrew/Brewfile'
alias bbd='brew bundle dump --force --file ~/.homebrew/Brewfile'
alias rm-all-images='container image ls --format yaml | rg "^ {4}name:" | sed -E 's/^.{10}//' | xargs -P 4 container image rm'

alias pi='container run -it  --rm -v "$PWD:/home/node/workspace" -v ~/Dev/pi-container/pi-agent:/home/node/.pi/agent pi-coding-agent:local'

alias path='print -l $path'
alias fd='fd -H'

pcopy() { 
	realpath "$1" | tr -d '\n' | pbcopy 
	echo "Copied location of $1 to clipboard"
}
