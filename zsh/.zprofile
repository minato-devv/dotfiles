typeset -U path fpath

path=("${HOME}/llama.cpp/build/bin" $path)
path=("$GOBIN" $path)
path=("$HOME/.local/bin" $path)
path=("/opt/homebrew/bin" $path)

fpath=("$ZDOTDIR/functions" $fpath)
fpath=("$ZDOTDIR/completion" $fpath)

cdpath=("$HOME" "$HOME/Dev" "$HOME/College" "$HOME/Documents" "$HOME/Downloads" "$HOME/Desktop" $cpath)
