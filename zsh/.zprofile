typeset -U path fpath

path=("$HOME/.local/bin" $path)
path=("/opt/homebrew/bin" $path)

fpath=("$ZDOTDIR/functions" $fpath)
fpath=("$ZDOTDIR/completion" $fpath)

cdpath=("$HOME" "$HOME/Dev" "$HOME/College" "$HOME/Documents" "$HOME/Downloads" "$HOME/Desktop" "$ICLOUD" $cdpath)
