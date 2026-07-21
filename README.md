# dotfiles

Simple zsh startup files setup.

```zsh
mkdir -p "$XDG_CACHE_HOME/zsh"
mkdir -p "$XDG_CACHE_HOME/zsh/sessions"
mkdir -p "$XDG_CACHE_HOME/zsh/zcompcache"
mkdir -p "$HOME/.config/zsh"
```

```zsh
$REPO_ROOT=<Choose a directory> git clone -b zsh https://github.com/minato-devv/dotfiles.git $REPO_ROOT
cd $REPO_ROOT
chmod +x symlink.sh
./symlink.sh zsh/.zshrc ${ZDOTDIR:-$HOME}/.zshrc
./symlink.sh zsh/.zshenv ${ZDOTDIR:-$HOME}/.zshenv
```

Notes:
* `.zshenv` > `.zprofile` > `.zshrc` > `.zlogin` > `.zlogout`
