.PHONY: help
help:
	echo "help"


.PHONY: setup-all
setup-all: deploy-dotfiles install-fish-plugins change-login-shell
	echo "setup-all"


.PHONY: deploy-dotfiles
deploy-dotfiles:
	./deploy-dotfiles.sh


.PHONY: install-fish-plugins
install-fish-plugins: install-fisher
	fisher install oh-my-fish/theme-bobthefish


.PHONY: change-login-shell
change-login-shell: install-packages
	./change-login-shell.sh


.PHONY: install-fisher
install-fisher: install-packages
	curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher


.PHONY: install-packages
install-packages: install-homebrew
	brew bundle --file Brewfile


.PHONY: install-casks
install-cask: install-homebrew
	brew bundle --file BrewfileCask


.PHONY: install-homebrew
install-homebrew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	export PATH="$PATH:/opt/homebrew/bin";
	which brew
