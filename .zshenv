export VISUAL='nvim'
export EDITOR='nvim'
export PAGER='less'

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"
export SHELL_SESSIONS_DISABLE=1

export HOMEBREW_NO_ASK=1
export HOMEBREW_CONFIG_HOME="$XDG_CONFIG_HOME/homebrew"
export HOMEBREW_CACHE="$XDG_CACHE_HOME/homebrew"
export HOMEBREW_LOGS="$XDG_STATE_HOME/homebrew/logs"
export HOMEBREW_NO_ENV_HINTS=1

export PYTHON_HISTORY=/dev/null
