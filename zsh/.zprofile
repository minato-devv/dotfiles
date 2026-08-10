typeset -U path fpath
path=("${HOME}/llama.cpp/build/bin" $path)
path=("$GOBIN" $path)
path=("$HOME/.local/bin" $path)
fpath=("$ZDOTDIR/completion" $fpath)
