### dotfiles

Use symlinks:

```sh
git clone https://github.com/minato-devv/dotfiles.git && cd dotfiles
mkdir -p ~/.config ~/.local/state ~/.cache
ln -s "$PWD/.zshenv" "$HOME/" && source "$HOME/.zshenv"
find "$PWD" -type d -mindepth 1 -maxdepth 1 -exec ln -s {} "$XDG_CONFIG_HOME/" \;
```
