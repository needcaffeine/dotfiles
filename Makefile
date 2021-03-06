# Set a default target.
.DEFAULT_GOAL := help

# Build variables.
PREFIX ?= $(PWD)
BREW_PREFIX=$(brew --prefix)

.PHONY: all
all: clean bootstrap dotfiles dnsmasq

.PHONY: help
help: #! Show this help message.
	@echo 'Usage: make [target] ...'
	@echo ''
	@echo 'Targets:'
	@fgrep -h "#!" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e "s/:.*#!/:/" | column -t -s":"

.PHONY: bootstrap
bootstrap: #! Set up our prerequisites.
	@echo 'Setting up necessary dependencies...'
	@/bin/sh bootstrap/install.sh

.PHONY: clean
clean: #! Clean up all traces of these dotfiles.
	find $(HOME)/ -maxdepth 1 -lname '$(CURDIR)/*' -delete
	@echo 'Dotfiles have been removed. Restart your terminal.'

.PHONY: shell
shell: #! Update bash to the newest version.
	brew install bash bash-completion2
	brew cask install iterm2
	if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then \
  		echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells; \
  		chsh -s "${BREW_PREFIX}/bin/bash"; \
	fi;

	# Install fasd, a command line productivity booster
	# https://github.com/clvv/fasd
	brew install fasd

	# Install the Solarized Dark theme
	open "$(CURDIR)/system/Solarized Dark.itermcolors"

.PHONY: dnsmasq
dnsmasq: #! Set up dnsmasq for routing to .docker hosts.
	brew install dnsmasq
	$(RM) /usr/local/etc/dnsmasq.conf && \
		mkdir -p /usr/local/etc/dnsmasq.d && \
		ln -sfn $(CURDIR)/dnsmasq/dnsmasq.conf /usr/local/etc/dnsmasq.conf && \
		ln -sfn $(CURDIR)/dnsmasq/dnsmasq.d/docker.conf /usr/local/etc/dnsmasq.d/docker.conf
	sudo mkdir -p /etc/resolver && \
		sudo ln -sfn $(CURDIR)/dnsmasq/resolver/docker /etc/resolver/docker
	sudo brew services restart dnsmasq
	sudo killall -HUP mDNSResponder; sudo dscacheutil -flushcache

.PHONY: dotfiles
dotfiles: #! Install the dotfiles.
	# Create symlinks to dotfiles.
	for src in $(shell find -H $(CURDIR) -maxdepth 2 -name *.symlink -not -path '*.git'); do \
		f=$$(basename $$src .symlink); \
		ln -sfn $$src "$(HOME)/$$f"; \
	done;

	@echo 'Dotfiles have been installed. Restart your shell.'

.PHONY: installers
installers: #! Run any installers.
	for installer in $(shell find -H $(CURDIR) -maxdepth 2 -name install.sh -not -path '*.git' -not -path '*bootstrap*'); do \
		/bin/sh $$installer; \
	done;
