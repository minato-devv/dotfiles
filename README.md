# dotfiles

Clone this repository, backup current dotfiles, symlink new dotfiles to appropriate locations.

To disable all git hints:

```zsh
git help --config | rg "^advice\." | xargs -I {} git config --global {} false
```
