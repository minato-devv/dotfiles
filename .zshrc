fpath+=${HOME}/.zsh/completion
path+=${HOME}/.lmstudio/bin
path+=${HOME}/llama.cpp/build/bin
path+=${HOME}/.mlx-venv/bin
path+=${HOME}/Dev/Fabric
path+=${HOME}/.mlx-vlm/.venv/bin

typeset -U path fpath

export EDITOR='nvim'
export HISTSIZE=1000
export SAVEHIST=1000
export HOMEBREW_NO_ASK=1

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

source ~/.aliases

pcopy() { 
	realpath "$1" | tr -d '\n' | pbcopy 
	echo "Copied location of $1 to clipboard"
}
