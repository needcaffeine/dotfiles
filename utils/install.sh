#!/bin/sh

# Install things we need for local development.
printf '\nInstalling development packages...\n'

# Javascript development
brew install \
    jq \
    node \
    nvm \
    yarn
mkdir -p ~/.nvm

# PHP development
brew install \
    composer && \
    ln -snf /usr/local/bin/composer /usr/local/bin/composer.phar

# IDEs and other guis
brew install --cask \
    mysql-shell \
    quicklook-json \
    sequel-pro \
    visual-studio-code

brew install --cask \
    docker

# Compilers, and clis.
brew install \
    awscli \
    gcc \
    gettext \
    pkg-config
brew link --force gettext

# Install things we use for collaboration and productivity.
printf '\nInstalling collaboration and productivity packages...\n'

# Browsers
brew install --cask \
    firefox

# Productivity boosters
brew install \
    speedtest-cli \
    wget

brew install --cask \
    flux \
    keepingyouawake \
    lastpass \
    spectacle \
    yubico-yubikey-manager

brew tap homebrew/cask-drivers
brew install --cask yubico-authenticator

# Collaboration packages
brew install --cask \
    slack \
    zoom
