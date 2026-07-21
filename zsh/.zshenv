export ZDOTDIR="$HOME/.config/zsh"
export EDITOR='nvim'

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

mkdir -p "$XDG_CACHE_HOME/zsh"
mkdir -p "$XDG_STATE_HOME/zsh"
mkdir -p "$HOME/.config/zsh"

export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
export ZSH_COMPCACHE_DIR="$XDG_CACHE_HOME/zsh/zcompcache"
export SHELL_SESSION_DIR="$XDG_CACHE_HOME/zsh/sessions"

fpath=("${HOME}/.zsh/completion" $fpath)
path=("${HOME}/.lmstudio/bin" $path)
path=("${HOME}/llama.cpp/build/bin" $path)
path=("${HOME}/.mlx-venv/bin" $path)
path=("${HOME}/Dev/Fabric" $path)
path=("${HOME}/.mlx-vlm/.venv/bin" $path)

typeset -U path fpath

export HOMEBREW_NO_ASK=1
