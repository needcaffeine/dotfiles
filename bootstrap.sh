#!/bin/bash

echo "==================================="
echo "Installing needcaffeine/dotfiles..."
echo "==================================="
echo

# Switch to the base directory.
dir="$(dirname "${BASH_SOURCE}")"
pushd $dir > /dev/null

# Pull in repository updates.
git pull origin master;

# Start your engines!
#read -p "This will overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
#echo "";
#if [[ ! $REPLY =~ ^[Yy]$ ]]; then
#    echo "Exiting."
#    echo
#    exit 1;
#fi;

# Link over all the relevant dot files.
#for f in $(ls -a . | grep -vE '(\.$|\.\.$|.DS_Store|.git|init|.osx|.sh$|.txt$|.md$)');
#do
#  rm ~/$f 2> /dev/null;
#  ln -s $dir/$f ~/$f;
#done;
#source ~/.bash_profile;

# Run homebrew stuff if this is mac os.
if [[ "$(uname)" == "Darwin" ]]; then
    echo
    echo "Executing homebrew and cask operations."
    echo

    # Install Homebrew if necessary.
    if [[ ! "$(which brew)" ]]; then
        echo "Installing Homebrew."
        echo
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
fi

# Run the brew installer to install all the things we need.
sh bin/brew.sh

# Install yadr.
echo "==================================="
echo "Installing yadr"
echo "==================================="
echo

sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"
chsh -s /bin/zsh
zsh
prompt steeef

popd > /dev/null;
