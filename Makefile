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
shell: #! Configure zsh and install oh-my-zsh.
	brew install --cask iterm2
	if ! fgrep -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then \
  		echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells; \
  		chsh -s "${BREW_PREFIX}/bin/zsh"; \
	fi;

	# Install the Solarized Dark theme
	open "$(CURDIR)/utils/Solarized Dark.itermcolors"

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
	@echo 'Creating symlinks to dotfiles.'
	@for src in $(shell find -H $(CURDIR) -name "*.symlink" -not -path '*.git'); do \
		dest=$(HOME)/$$(basename $$src .symlink); \
		ln -sfn $$src $$dest; \
	done;

	@# Our oh-my-zsh plugins
	@cp -R $(CURDIR)/zsh/.oh-my-zsh/ $(HOME)/.oh-my-zsh/

	@echo 'Dotfiles have been installed. Restart your shell.'

.PHONY: installers
installers: #! Run any installers.
	for installer in $(shell find -H $(CURDIR) -maxdepth 2 -name install.sh -not -path '*.git' -not -path '*bootstrap*'); do \
		/bin/sh $$installer; \
	done;
