BREW := /opt/homebrew
OHMYZSH := $(HOME)/.oh-my-zsh

.PHONY: all 
all: brew zsh git

.PHONY: brew
brew: | $(BREW) ## Install brew if it isn't installed, then update brew 
	ln  -sfn $(CURDIR)/Brewfile $(HOME)/Brewfile
	brew bundle

$(BREW): ## Install brew if it's not installed already
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: zsh 
zsh: | $(OHMYZSH) ## Install the zsh related dotfiles.
	@echo "Starting zsh Setup..."

	ln -sfn $(CURDIR)/zsh/zshenv $(HOME)/.zshenv
	ln -sfn $(CURDIR)/zsh/zshrc $(HOME)/.zshrc
	ln -sfn $(CURDIR)/zsh/zalias $(HOME)/.zalias

	@cp $(CURDIR)/zsh/zsecrets $(HOME)/.zsecrets
	@read -p "Enter your GitHub token: " github_token; \
		sed -i -e "s/{{GITHUB_TOKEN}}/$$github_token/g" $(HOME)/.zsecrets

	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 2>/dev/null ||:
	git clone https://github.com/zsh-users/zsh-autosuggestions $(HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions 2>/dev/null ||:
	
	@echo "Done! (zsh)\n"

$(OHMYZSH):
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

.PHONY: git
git: ## Install git configs.
	ln -sfn $(CURDIR)/git/gitalias $(HOME)/.gitalias
	@cp $(CURDIR)/git/gitconfig $(HOME)/.gitconfig
	@read -p "Enter your name: " git_name; \
		sed -i -e "s/{{GIT_NAME}}/$$git_name/g" $(HOME)/.gitconfig
	@read -p "Enter your e-mail: " git_email; \
		sed -i -e "s/{{GIT_EMAIL}}/$$git_email/g" $(HOME)/.gitconfig
	@read -p "Enter your GPG key ID: " git_sign_key; \
		sed -i -e "s/{{GIT_SIGN_KEY}}/$$git_sign_key/g" $(HOME)/.gitconfig

.PHONY: asdf
asdf: 
	@asdf plugin-add java https://github.com/halcyon/asdf-java.git || true
	@echo "Select Java version to install"; \
		export JAVA_VER=$$(asdf list-all java | fzf --height 40%); \
		asdf install java $$JAVA_VER
		asdf global java $$JAVA_VER
	@echo "Select Python3 version to install"; \
		export PY_VER=$$(asdf list-all python | fzf --height 40%); \
		asdf install python $$PY_VER
		asdf global python $$PY_VER
