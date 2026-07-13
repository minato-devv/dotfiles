# dotfiles

Personal configuration files for shell and development tooling.

## Overview

This repository stores dotfiles and related config used to set up a consistent local development environment.

## Contents / stack

Top-level items include:
- `Brewfile` – package list for Homebrew Bundle
- `symlink.sh` – helper script to symlink a file from this repo into `$HOME`
- `.zshrc`, `.aliases` – shell behavior and aliases
- `.gitconfig`, `.gitignore_global` – Git defaults
- `fastfetch/`, `ghostty/`, `nvim/`, `opencode/` – tool-specific configuration

## Installation / setup

> Safe approach: review files before applying them to your machine.

1. Clone the repository:

```bash
git clone https://github.com/minato-devv/dotfiles.git
cd dotfiles
```

2. Back up existing local dotfiles before replacing/symlinking:

```bash
cp ~/.zshrc ~/.zshrc.backup 2>/dev/null || true
cp ~/.gitconfig ~/.gitconfig.backup 2>/dev/null || true
```

3. Link selected files manually (recommended):

```bash
ln -s "$PWD/.zshrc" "$HOME/.zshrc"
ln -s "$PWD/.aliases" "$HOME/.aliases"
```

4. Or use the helper script for one file at a time:

```bash
./symlink.sh .zshrc .zshrc
./symlink.sh .aliases .aliases
```

5. (Optional) Install packages from `Brewfile`:

```bash
brew bundle install --file ./Brewfile
```

## Usage

After linking files:

```bash
source ~/.zshrc
```

Then open a new terminal session and verify your shell aliases, prompt, and tool configs are loaded as expected.

## Customization

- Edit files in this repository, then reload your shell/app.
- Prefer keeping machine-specific values in local, untracked files where possible.
- Apply changes incrementally (one config at a time) to reduce risk.

## License

This repository includes a `LICENSE` file (MIT License).
