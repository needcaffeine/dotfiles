#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# Install some networking tools.
brew install nmap

# Install other useful binaries.
brew install ack
brew install boot2docker
brew install docker
brew install emacs
brew install fasd
brew install ffmpeg
brew install git
brew install htop-osx
brew install httpie
brew install imagemagick --with-webp
brew install lynx
brew install macvim --custom-icons --override-system-vim --with-lua --with-luajit
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install s3cmd
brew install speedtest_cli
brew install the_silver_searcher
brew install tmux
brew install tree
brew install youtube-dl
brew install webkit2png

# Install Node.js. Note: this installs `npm` too, using the recommended
# installation method.
brew install node
npm install -g grunt-cli
npm install -g bower

# We want to use pip and virtualenv and all of that.
brew install python
pip install --upgrade setuptools
pip install --upgrade pip
pip install virtualenv
brew linkapps python

# Install caskroom so we can manage applications.
brew install caskroom/cask/brew-cask

# Now we need to install a bunch of casks.
brew cask install amazon-music
brew cask install arq
brew cask install atom
brew cask install calibre
brew cask install cord
brew cask install dropbox
brew cask install emacs
brew cask install firefox
brew cask install flux
brew cask install garmin-communicator
brew cask install google-chrome
brew cask install google-drive
brew cask install joinme
brew cask install keepingyouawake
brew cask install lastpass
brew cask install microsoft-office
brew cask install nvalt
brew cask install phpstorm
brew cask install postbox
brew cask install picasa
brew cask install skype
brew cask install slack
brew cask install spotify
brew cask install steam
brew cask install the-unarchiver
brew cask install transmission
brew cask install panic-unison
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc
brew cask install ynab

# Alternate versions
brew tap caskroom/versions
brew cask install iterm2-beta
brew cask install sublime-text3

# Remove outdated versions from the cellar.
brew cleanup
