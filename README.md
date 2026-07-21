# dotfiles

Simple zsh startup files setup.

```zsh
$REPO_ROOT=<Choose a directory> git clone -b zsh https://github.com/minato-devv/dotfiles.git $REPO_ROOT
chmod +x symlink.sh
./symlink.sh $REPO_ROOT/zsh/.zshrc ${ZDOTDIR:-$HOME}/.zshrc
./symlink.sh $REPO_ROOT/zsh/.zshenv $HOME/.zshenv
```

Notes:
* `.zshenv` > `.zprofile` > `.zshrc` > `.zlogin` > `.zlogout`
