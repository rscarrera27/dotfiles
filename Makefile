GPG_KEY := D7D64144
GPG_DIR := $(CURDIR)/.gpg

.PHONY: apply
apply:
	@xcode-select -p >/dev/null 2>&1 || (xcode-select --install && echo "Install Xcode CLT and re-run make" && exit 1)
	@test -d $(GPG_DIR) || (echo "ERROR: .gpg/ not found. Run 'make gpg-export' on the old machine first." && exit 1)
	sh -c "$$(curl -fsLS get.chezmoi.io)" -- init --apply --source $(CURDIR)
	gpg --import $(GPG_DIR)/public.asc
	gpg --import $(GPG_DIR)/secret.asc
	gpg --import-ownertrust $(GPG_DIR)/ownertrust.txt
	rm -rf $(GPG_DIR)
	@echo "GPG key imported and .gpg/ removed."

.PHONY: gpg-export
gpg-export:
	@mkdir -p $(GPG_DIR)
	gpg --armor --export-secret-keys $(GPG_KEY) > $(GPG_DIR)/secret.asc
	gpg --armor --export $(GPG_KEY) > $(GPG_DIR)/public.asc
	gpg --export-ownertrust > $(GPG_DIR)/ownertrust.txt
	@echo "Exported to .gpg/ — transfer this directory to the new machine."
