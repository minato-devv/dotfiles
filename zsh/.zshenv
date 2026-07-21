export EDITOR='nvim'

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"

# export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"
# export ZSH_COMPCACHE_DIR="$XDG_CACHE_HOME/zsh/zcompcache"
# export SHELL_SESSION_DIR="$XDG_CACHE_HOME/zsh/sessions"

typeset -U path fpath
fpath=("${HOME}/.zsh/completion" $fpath)
path=("${HOME}/.lmstudio/bin" $path)
path=("${HOME}/llama.cpp/build/bin" $path)
path=("${HOME}/.mlx-venv/bin" $path)
path=("${HOME}/Dev/Fabric" $path)
path=("${HOME}/.mlx-vlm/.venv/bin" $path)

export HOMEBREW_NO_ASK=1
