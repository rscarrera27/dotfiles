BREW := /usr/local/bin/brew


.PHONY: brew
brew: | $(BREW) ## Install brew if it isn't installed, then update brew 
	ln  -sfn $(CURDIR)/Brewfile $(HOME)/Brewfile
	brew bundle

$(BREW): ## Install brew if it's not installed already
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: zsh 
bash: ## Install the zsh related dotfiles.
	@echo "Starting zsh Setup..."
	ln -sfn $(CURDIR)/zshrc $(HOME)/.zshrc
	@echo "Done! (bash)\n"

.PHONY: git
git: ## Install git configs.
	@cp $(CURDIR)/gitconfig $(HOME)/.gitconfig
	@read -p "Enter your name: " git_name; \
		sed -i -e "s/{{GIT_NAME}}/$$git_name/g" $(HOME)/.gitconfig
	@read -p "Enter your e-mail: " git_email; \
		sed -i -e "s/{{GIT_EMAIL}}/$$git_email/g" $(HOME)/.gitconfig
	@read -p "Enter your GPG key ID: " git_sign_key; \
		sed -i -e "s/{{GIT_SIGN_KEY}}/$$git_sign_key/g" $(HOME)/.gitconfig
