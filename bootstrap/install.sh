#!/bin/sh

# Check for Homebrew
printf 'Checking for Homebrew...\n'
if test ! $(which brew)
then
	printf 'Installing Homebrew for you.\n'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
printf '✅ Homebrew is installed.'

# Check for Oh My Zsh
printf 'Installing Oh My Zsh for you.\n'
ZSH= /bin/sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
printf '✅ Oh My Zsh is installed.'

exit 0
