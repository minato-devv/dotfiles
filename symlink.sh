#!/bin/bash

create_symlink() {
	local target="$1"
	local link_name="$2"

	if [ -z "$target" ] || [ -z "$link_name" ]; then
		echo "Usage: $0 <target_path> <link_name>"
		return 1
	fi

	ln -s "$PWD/$target" "$HOME/$link_name"
}

create_symlink "$1" "$2"
