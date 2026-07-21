# dotfiles

Simple zsh startup files setup.

## Install

```zsh
$REPO_ROOT=<Choose a directory> git clone -b zsh https://github.com/minato-devv/dotfiles.git $REPO_ROOT
chmod +x symlink.sh
./symlink.sh $REPO_ROOT/zsh/.zshrc ${ZDOTDIR:-$HOME}/.zshrc
./symlink.sh $REPO_ROOT/zsh/.zshenv $HOME/.zshenv
```

## Files

### `zsh/.zshenv`
```zsh
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
```

### `zsh/.zshrc`
```zsh
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
alias ez='${EDITOR} $ZDOTDIR/.zshrc'
alias ee='${EDITOR} $HOME/.zshenv'

# Viewing
alias cz='cat $ZDOTDIR/.zshrc'
# Sourcing
alias z='source $HOME/.zshenv && source $ZDOTDIR/.zshrc'

alias ls='eza -A --group-directories-first --hyperlink always --icons always'
alias cat='bat'
alias vim='nvim'

alias ff='fastfetch'
alias tree='fd -d 2'
alias du='du -sh'
alias size='du -sh * | sort -hr'
alias top='top -stats mem,cpu,command,state,time,power -o -mem -s 2 -U user'

alias fm-server='fm serve > ${HOME}/logs/fm.log 2>&1 &'
alias kill-fm='pkill -f "fm serve"'

alias pysour='source .venv/bin/activate'
alias pyvenv='python3 -m venv .venv && pysour'

alias vencord='${HOME}/Installer/vencordinstaller'

alias fcommit='fabric -p create_git_diff_commit'

alias bbl='brew bundle list --file ~/.homebrew/Brewfile'
alias bbd='brew bundle dump --force --file ~/.homebrew/Brewfile'
alias rm-all-images='container image ls --format yaml | rg "^ {4}name:" | sed -E 's/^.{10}//' | xargs -P 4 container image rm'

alias pi='container run -it  --rm -v "$PWD:/home/node/workspace" -v ~/Dev/pi-container/pi-agent:/home/node/.pi/agent pi-coding-agent:local'

pcopy() { 
	realpath "$1" | tr -d '\n' | pbcopy 
	echo "Copied location of $1 to clipboard"
}
```

### `symlink.sh`
```bash
#!/bin/bash

create_symlink() {
	local target="$1"
	local link_name="$2"

	if [ -z "$target" ] || [ -z "$link_name" ]; then
		echo "Usage: $0 <target_path> <link_name>"
		return 1
	fi

	ln -s "$target" "$link_name"
}

create_symlink "$1" "$2"
```

## Notes
- Startup order: `.zshenv` > `.zprofile` > `.zshrc` > `.zlogin` > `.zlogout`
- License: MIT