# My dotfiles

You always have the option of building your dotfiles repo from scratch, or looking through the work of others for inspiration: https://dotfiles.github.io/

At present, I start with someone else's dotfiles, in this case the very famous and mega useful YADR: https://github.com/skwp/dotfiles

To get started, run:
```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"
```

Next, I have a script that installs all my [homebrew][1] utilities; things that should have been part of OS X but Apple left out. This script also manages _most_ of my applications through [Cask][2]. You may examine the contents of the script [here][3]. If you want to follow my recommendation and just install all the same things, run:
```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/needcaffeine/dotfiles/master/bin/brew.sh`"
```
This script is going to take a while to finish but it'll save you several hours of work, especially when you're setting up a new Mac. Run it every now and then to upgrade all your applications.

[1]: http://brew.sh/
[2]: http://caskroom.io/
[3]: https://github.com/needcaffeine/dotfiles/blob/master/bin/brew.sh
