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
printf '\n\nInstalling Oh My Zsh for you.\n'
ZSH= /bin/sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
printf '✅ Oh My Zsh is installed.'

# Install Rosetta 2, for Macs with Apple silicon to use apps built for Intel
printf '\n\nInstalling Rosetta 2.\n'
sudo softwareupdate --install-rosetta
printf '✅ Rosetta 2 is installed.'


exit 0
