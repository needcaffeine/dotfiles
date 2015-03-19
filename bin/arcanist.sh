# Stolen from https://gist.github.com/tals/8414170
# Credit to https://github.com/tals

#!/bin/bash
dir="~/Applications/arcanist/"

# See if arcanist is already installed.
eval dir=$dir
if [ -d "$dir" ]; then
    read -p "arc already installed. Remove and install again? (y/n) " -n 1
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting."
        exit
    fi

    rm -fR "$dir"
    echo "Removed."
    echo
fi

# We need to install it.
mkdir -p ~/Applications/arcanist
pushd ~/Applications/arcanist > /dev/null
git clone git://github.com/facebook/libphutil.git
git clone git://github.com/facebook/arcanist.git
ln -Fs ~/Applications/arcanist/arcanist/bin/arc /usr/local/bin/arc
popd > /dev/null

echo "Installed!"
echo
echo "If this is your first time, run \033[92marc install-certificate\033[0m in your project's directory."
