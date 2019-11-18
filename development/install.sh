#!/bin/sh

# Install things we need for local development.
echo
printf 'Installing development packages...'
echo

# Javascript
brew install \
    jq \
    node \
    nvm \
    yarn
mkdir -p ~/.nvm

# PHP
brew install \
    composer && \
    ln -snf /usr/local/bin/composer /usr/local/bin/composer.phar

# Java
brew install \
    gradle

# IDEs and other guis
brew cask install \
    intellij-idea-ce \
    java \
    mysql-shell \
    quicklook-json \
    sequel-pro \
    visual-studio-code

brew cask install \
    docker

# Compilers, and clis.
brew install \
    awscli \
    gcc \
    gettext \
    pkg-config
brew link --force gettext
