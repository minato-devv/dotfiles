export EDITOR='nvim'
export PAGER='less'

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"

# if [ -x /usr/libexec/path_helper ]; then
#     eval `/usr/libexec/path_helper -s`
# fi

typeset -U path fpath
eval "$(/opt/homebrew/bin/brew shellenv)"
path=("${HOME}/.lmstudio/bin" $path)
path=("${HOME}/llama.cpp/build/bin" $path)
path=("${HOME}/Dev/Fabric" $path)

fpath=("$ZDOTDIR/completion" $fpath)

export HOMEBREW_NO_ASK=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export BAT_THEME="ansi"
export CONTAINER_DEBUG=1
