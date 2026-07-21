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
# export PROMPT='%w %3~ ⌘ '

pcopy() { 
	realpath "$1" | tr -d '\n' | pbcopy 
	echo "Copied location of $1 to clipboard"
}

alias ls='eza -A --group-directories-first --hyperlink always --icons always'
alias cat='bat'
alias vim='nvim'

alias eg='${EDITOR} ${HOME}/.config/ghostty/config'
alias ez='${EDITOR} ${HOME}/.zshrc'
alias cz='bat ${HOME}/.zshrc'
alias sz='source ${HOME}/.zshrc'
alias xz='exec zsh'
alias ed='cd "/Users/user/Library/Mobile Documents/com~apple~CloudDocs/Documents/Dev-backups/.dotfiles"'
alias ea='${EDITOR} "${HOME}/.aliases"'

alias pysour='source .venv/bin/activate'
alias pyvenv='python3 -m venv .venv && pysour'

alias du='du -sh'
alias top='top -stats mem,cpu,command,state,time,power -o -mem -s 2 -U user'

alias vencord='${HOME}/Installer/vencordinstaller'

alias draft-commit='fabric -p create_git_diff_commit'

alias bbl='brew bundle list --file ~/.homebrew/Brewfile'
alias bbd='brew bundle dump --force --file ~/.homebrew/Brewfile'
alias ff='fastfetch'
alias tree='fd -d 2'
alias rm-all-images='container image ls --format yaml | rg "^ {4}name:" | sed -E 's/^.{10}//' | xargs -P 4 container image rm'
alias size='du -sh * | sort -hr'

alias pi='container run -it  --rm -v "$PWD:/home/node/workspace" -v ~/Dev/pi-container/pi-agent:/home/node/.pi/agent pi-coding-agent:local'
