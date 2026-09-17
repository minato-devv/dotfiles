### dotfiles

Use symlinks:

```sh
git clone https://github.com/minato-devv/dotfiles.git
cd dotfiles
find . -type d -mindepth 1 -maxdepth 1 -exec ln -s "$PWD/{}" "$XDG_CONFIG_HOME/" \;
ln -s "$PWD/.zshenv" "$HOME/.zshenv"
```
