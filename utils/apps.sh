#!/bin/sh

set -eu

printf '\nInstalling optional applications...\n'

brew install --cask \
    1password \
    calibre \
    discord \
    docker-desktop \
    google-chrome \
    keepingyouawake \
    mysql-shell \
    raycast \
    sequel-ace \
    slack \
    telegram \
    visual-studio-code \
    yubico-authenticator \
    zoom
