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

# IDEs and other guis
brew install --cask \
    mysql-shell \
    quicklook-json \
    sequel-ace \
    visual-studio-code

brew install --cask \
    docker

# Compilers, and clis.
brew install \
    awscli \
    coreutils \
    gcc \
    gettext \
    pkg-config
brew link --force gettext

# Install things we use for collaboration and productivity.
printf '\nInstalling collaboration and productivity packages...\n'

# Browsers
brew install --cask \
    google-chrome

# Productivity boosters
brew install \
    speedtest-cli \
    tree \
    wget

# Various tools
brew install --cask \
    1password \
    calibre \
    keepingyouawake \
    raycast \
    yubico-authenticator

# Collaboration packages
brew install --cask \
    discord \
    slack \
    telegram \
    zoom
