# Set a default target.
.DEFAULT_GOAL := help

# Build variables.
PREFIX ?= $(CURDIR)
export PATH := /opt/homebrew/bin:$(PATH)
BREW_PREFIX := $(shell brew --prefix 2>/dev/null)

.PHONY: all
all: bootstrap dotfiles installers

.PHONY: help
help: #! Show this help message.
	@echo 'Usage: make [target] ...'
	@echo ''
	@echo 'Targets:'
	@fgrep -h "#!" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e "s/:.*#!/:/" | column -t -s":"

.PHONY: bootstrap
bootstrap: #! Install Homebrew, Oh My Zsh, and iTerm2.
	@echo 'Setting up necessary dependencies...'
	@/bin/sh bootstrap/install.sh

	@# macOS includes and configures zsh as the default login shell.
	@brew install --cask iterm2

	@# Install the Solarized Dark theme
	@echo "Open up iTerm now and run the following command:\n"
	@echo 'open "$(CURDIR)/utils/Solarized Dark.itermcolors"'

.PHONY: clean
clean: #! Clean up all traces of these dotfiles.
	find $(HOME)/ -maxdepth 1 -lname '$(CURDIR)/*' -delete
	@echo 'Dotfiles have been removed. Restart your terminal.'

.PHONY: dnsmasq
dnsmasq: #! Set up dnsmasq for routing to .docker hosts.
	brew install dnsmasq
	$(RM) $(BREW_PREFIX)/etc/dnsmasq.conf && \
		mkdir -p $(BREW_PREFIX)/etc/dnsmasq.d && \
		ln -sfn $(CURDIR)/dnsmasq/dnsmasq.conf $(BREW_PREFIX)/etc/dnsmasq.conf && \
		ln -sfn $(CURDIR)/dnsmasq/dnsmasq.d/docker.conf $(BREW_PREFIX)/etc/dnsmasq.d/docker.conf
	sudo mkdir -p /etc/resolver && \
		sudo ln -sfn $(CURDIR)/dnsmasq/resolver/docker /etc/resolver/docker
	brew services restart dnsmasq
	sudo killall -HUP mDNSResponder; sudo dscacheutil -flushcache

.PHONY: dotfiles
dotfiles: #! Install the dotfiles.
	@echo 'Creating symlinks to dotfiles.'
	@for src in $(shell find -H $(CURDIR) -name "*.symlink" -not -path '*.git'); do \
		if [ "$$src" = "$(CURDIR)/zsh/.zshrc.local.symlink" ] || \
		   [ "$$src" = "$(CURDIR)/git/.gitconfig.local.example.symlink" ]; then \
			continue; \
		fi; \
		dest=$(HOME)/$$(basename $$src .symlink); \
		ln -sfn $$src $$dest; \
	done;

	@# Seed local configs (copied, not symlinked, so edits stay private)
	@if [ ! -f "$(HOME)/.zshrc.local" ]; then \
		echo 'Creating ~/.zshrc.local.'; \
		cp "$(CURDIR)/zsh/.zshrc.local.symlink" "$(HOME)/.zshrc.local"; \
	fi
	@if [ ! -f "$(HOME)/.gitconfig.local" ]; then \
		echo 'Creating ~/.gitconfig.local.'; \
		cp "$(CURDIR)/git/.gitconfig.local.example.symlink" "$(HOME)/.gitconfig.local"; \
	fi

	@# Install Powerlevel10k
	@if [ ! -d "$(HOME)/.oh-my-zsh/custom/themes/powerlevel10k" ]; then \
		echo 'Installing Powerlevel10k.'; \
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$(HOME)/.oh-my-zsh/custom/themes/powerlevel10k"; \
	else \
		echo 'Updating Powerlevel10k.'; \
		git -C "$(HOME)/.oh-my-zsh/custom/themes/powerlevel10k" pull --ff-only; \
	fi

	@# Our oh-my-zsh plugins
	@cp -R $(CURDIR)/zsh/.oh-my-zsh/ $(HOME)/.oh-my-zsh/

	@echo 'Dotfiles have been installed. Restart your shell.'

.PHONY: installers
installers: #! Install core development tools.
	for installer in $(shell find -H $(CURDIR) -maxdepth 2 -name install.sh -not -path '*.git' -not -path '*bootstrap*'); do \
		/bin/sh $$installer; \
	done;

.PHONY: apps
apps: #! Install optional GUI, communication, and productivity apps.
	@/bin/sh utils/apps.sh
