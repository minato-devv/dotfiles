export VISUAL='nvim'
export EDITOR='nvim'
export PAGER='less'
# export LESS='-R -X'

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"

export GOPATH="$HOME/.local/go"
export GOBIN="$GOPATH/bin"
export GOCACHE="$GOPATH/build"
export GOMODCACHE="$GOPATH/mod"

# if [ -x /usr/libexec/path_helper ]; then
#     eval `/usr/libexec/path_helper -s`
# fi

typeset -U path fpath
path=("${HOME}/llama.cpp/build/bin" $path)
path=("$GOBIN" "$HOME/.local/bin" $path)

fpath=("$ZDOTDIR/completion" $fpath)

export HOMEBREW_NO_ASK=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export BAT_THEME="ansi"
export CONTAINER_DEBUG=1
export CLICOLOR=1
