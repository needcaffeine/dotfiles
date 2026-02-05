# dotfiles

## disclaimers

- Buyer beware
- These dotfiles are guaranteed to work only in Mac OS. They will probably also work in Linux but I have not tested them.

## installing

    $ git clone https://github.com/needcaffeine/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ make

Running `make` will show you all available options. You may decide you don't want all the things this repo does.

### local zsh config

After install, a local config file is created at `~/.zshrc.local`. This file is not tracked by git and is intended for private functions, secrets, or machine-specific settings.

## updating

You may periodically need to pull in my latest changes.

    $ cd ~/.dotfiles
    $ git pull
    $ make

## thanks

I stole bits and pieces from:
- [holman](https://github.com/holman/dotfiles)
- [jessfraz](https://github.com/jessfraz/dotfiles)
- [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
- [skwp](https://github.com/skwp/dotfiles)
