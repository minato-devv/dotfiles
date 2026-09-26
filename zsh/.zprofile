typeset -U path fpath

path=("/opt/homebrew/bin" $path)
path=("/Applications/SF Symbols.app/Contents/Executables/" $path)

fpath=("$ZDOTDIR/functions" $fpath)
fpath=("$ZDOTDIR/completion" $fpath)

cdpath=(
	"$XDG_CONFIG_HOME"
	"$HOME"
	"$HOME/Dev"
	"$HOME/College"
	"$HOME/Documents"
	"$HOME/Downloads"
	"$HOME/Desktop"
	"$ICLOUD"
	$cdpath
)
