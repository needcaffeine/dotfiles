#!/bin/sh

# Check for Homebrew
printf 'Checking for Homebrew...\n'
if test ! $(which brew)
then
	printf 'Installing Homebrew for you.\n'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

printf '✅ Homebrew is installed.'

exit 0
