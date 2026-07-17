#!/bin/sh

# Stop on errors and unset variables.
set -eu

if [ "$(uname -m)" != "arm64" ]; then
	printf 'This setup supports Apple silicon Macs only.\n' >&2
	exit 1
fi

# Check for Homebrew.
printf 'Checking for Homebrew...\n'
if ! command -v brew >/dev/null 2>&1
then
	printf 'Installing Homebrew for you.\n'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
printf 'Homebrew is installed.\n'

# Check for Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh/.git" ]; then
	printf 'Installing Oh My Zsh.\n'
	git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
else
	printf 'Oh My Zsh is already installed.\n'
fi

exit 0
