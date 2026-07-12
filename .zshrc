fpath+=${HOME}/.zsh/completion
path+=${HOME}/.lmstudio/bin
path+=${HOME}/llama.cpp/build/bin
path+=${HOME}/.mlx-venv/bin
path+=${HOME}/Dev/Fabric

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

autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' file-list all
zstyle ':completion:*' file-sort change

export PROMPT='%w %3~ »»» '


alias ls='eza -A --group-directories-first --hyperlink always --icons always'
alias cat='bat'
alias vim='nvim'

alias eg='${EDITOR} ${HOME}/.config/ghostty/config'

alias ez='${EDITOR} ${HOME}/.zshrc'
alias cz='bat ${HOME}/.zshrc'
alias sz='source ${HOME}/.zshrc'
alias xz='exec zsh'

alias pysour='source .venv/bin/activate'
alias pyvenv='python3 -m venv .venv && pysour'

alias du='du -sh'
alias top='top -stats mem,cpu,command,state,time,power -o -mem -s 2 -U user'

export qwen9b='/Users/user/.cache/huggingface/hub/models--unsloth--Qwen3.5-9B-GGUF/snapshots/3885219b6810b007914f3a7950a8d1b469d598a5/Qwen3.5-9B-Q6_K.gguf'
export qwythosmtp='/Users/user/.cache/huggingface/hub/models--empero-ai--Qwythos-9B-Claude-Mythos-5-1M-GGUF/snapshots/a7ab0f6ee807c165e8374e4906773ca39f5fdff3/Qwythos-9B-Claude-Mythos-5-1M-Q4_K_M.gguf'
export qwythos='/Users/user/.cache/huggingface/hub/models--empero-ai--Qwythos-9B-Claude-Mythos-5-1M-GGUF/blobs/88c75f5a2684d07ac4b08e47f06cf6f65045072b1aeb29b33cf50cdae2d8cea1'

alias qwenllama='cd ~/llama.cpp && ./build/bin/llama-server -m $qwen9b -c 32768 -ctk q8_0 -ctv q8_0 -fa on -ngl 99 -b 256 -ub 256'

alias vencord='${HOME}/Installer/vencordinstaller'
alias buuc='brew update; brew upgrade; brew cleanup --prune=all'
pcopy() { 
	realpath "$1" | tr -d '\n' | pbcopy 
	echo "Copied location of $1 to clipboard"
}

alias ai-commit='git diff | fabric --stream -p create_git_diff_commit'
alias bbl='brew bundle list --file ~/.homebrew/Brewfile'
