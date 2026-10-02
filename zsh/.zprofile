typeset -gUxT PATH path
path=(
	"/Applications/SF Symbols.app/Contents/Executables/"
	"/opt/homebrew/bin"
	$path
)

typeset -gUxT FPATH fpath
fpath=(
	"$ZDOTDIR/functions"
	"$ZDOTDIR/completion" 
	"/opt/homebrew/completions/zsh"
	$fpath
)

typeset -gUxT CDPATH cdpath
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
