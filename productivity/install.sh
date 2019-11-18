#!/bin/sh

# Install things we use for collaboration and productivity.
echo
printf 'Installing collaboration and productivity packages...'
echo

# Browsers
brew cask install \
    firefox

# Productivity boosters
brew install \
    speedtest-cli \
    wget

brew cask install \
    flux \
    keepingyouawake \
    lastpass \
    spectacle \
    spotify \
    yubico-yubikey-manager

brew tap homebrew/cask-drivers
brew cask install yubico-authenticator

# Collaboration packages
brew cask install \
    dropbox \
    google-backup-and-sync \
    slack \
    zoomus
