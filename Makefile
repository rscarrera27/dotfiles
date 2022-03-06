BREW := /usr/local/bin/brew
RUST := $(HOME))/.cargo/bin/rustup
POETRY := $(HOME)/.poetry/bin/poetry
OHMYZSH := $(HOME)/.oh-my-zsh

.PHONY: all 
all: brew zsh git poetry rust


.PHONY: brew
brew: | $(BREW) ## Install brew if it isn't installed, then update brew 
	ln  -sfn $(CURDIR)/Brewfile $(HOME)/Brewfile
	brew bundle

$(BREW): ## Install brew if it's not installed already
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap homebrew/bundle

.PHONY: zsh 
zsh: | $(OHMYZSH) ## Install the zsh related dotfiles.
	@echo "Starting zsh Setup..."

	ln -sfn $(CURDIR)/zsh/zshenv $(HOME)/.zshenv
	ln -sfn $(CURDIR)/zsh/zshrc $(HOME)/.zshrc
	ln -sfn $(CURDIR)/zsh/zalias $(HOME)/.zalias

	@cp $(CURDIR)/zsh/zsecrets $(HOME)/.zsecrets
	@read -p "Enter your GitHub token: " github_token; \
		sed -i -e "s/{{GITHUB_TOKEN}}/$$github_token/g" $(HOME)/.zsecrets
	@read -p "Enter your GitHub Enterprise token: " github_prvt_token; \
		sed -i -e "s/{{GITHUB_PRVT_TOKEN}}/$$github_prvt_token/g" $(HOME)/.zsecrets
	
	@cp -r $(CURDIR)/zsh/zfunc/. $(HOME)/.zfunc/
	@read -p "Enter cloud config server host: : " cloudconf_host; \
		sed -i -e "s/{{CLOUDCONFIG_HOST}}/$$cloudconf_host/g" $(HOME)/.zfunc/cloudconf

	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 2>/dev/null ||:
	git clone git://github.com/zsh-users/zsh-autosuggestions $(HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions 2>/dev/null ||:
	
	@echo "Done! (zsh)\n"

$(OHMYZSH):
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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

.PHONY: rust
rust: | $(RUST)
	rustup update
	rustup set profile complete
	rustup completions zsh > ~/.zfunc/_rustup
	rustup completions zsh cargo > ~/.zfunc/_cargo

$(RUST):
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

.PHONY: poetry
poetry: | $(POETRY)
	poetry self update
	mkdir -p $(ZSH)/plugins/poetry
	poetry completions zsh > $(ZSH)/plugins/poetry/_poetry

$(POETRY):
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
