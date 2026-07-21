# dotfiles

Simple zsh startup files setup.

```zsh
mkdir -p "$XDG_CACHE_HOME/zsh"
mkdir -p "$XDG_CACHE_HOME/zsh/sessions"
mkdir -p "$XDG_CACHE_HOME/zsh/zcompcache"
mkdir -p "$HOME/.config/zsh"
```

Notes:
* `.zshenv` > `.zprofile` > `.zshrc` > `.zlogin` > `.zlogout`
* `zsh/.zprofile` overwrites environment variables that were set in `/etc/zprofile`
