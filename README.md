# dotfiles

## requirements

- macOS on Apple silicon
- An administrator account
- Internet access

## installing

    $ git clone https://github.com/needcaffeine/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ make all

`make all` installs the shell environment, links the dotfiles, and installs the
core development tools. It does not install optional desktop applications or
configure dnsmasq.

To install the optional desktop applications:

    $ make apps

To see every available target without changing the machine:

    $ make help

The setup is designed to be rerun safely. Homebrew skips packages and
applications that are already installed.

### local zsh config

After install, a local config file is created at `~/.zshrc.local`. This file is not tracked by git and is intended for private functions, secrets, or machine-specific settings.

## updating

You may periodically need to pull in my latest changes.

    $ cd ~/.dotfiles
    $ git pull
    $ make all

## thanks

I stole bits and pieces from:
- [holman](https://github.com/holman/dotfiles)
- [jessfraz](https://github.com/jessfraz/dotfiles)
- [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [skwp](https://github.com/skwp/dotfiles)
