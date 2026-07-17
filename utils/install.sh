#!/bin/sh

set -eu

# Install things we need for local development.
printf '\nInstalling development packages...\n'

# Shell and development tools.
brew install \
    awscli \
    coreutils \
    gcc \
    gettext \
    jq \
    nvm \
    pkg-config \
    tree \
    wget \
    zoxide \
    zsh-autosuggestions \
    zsh-syntax-highlighting
mkdir -p ~/.nvm

# Install the current Node.js LTS release through NVM. Node ships with Corepack,
# which manages Yarn and pnpm without separate global Homebrew packages.
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"
nvm install --lts
nvm alias default 'lts/*'
corepack enable

brew link --force gettext
