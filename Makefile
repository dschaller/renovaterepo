SHELL:=/usr/bin/env bash
YARN:=./build/bin/yarn.sh

.PHONY: help # Print this help message.
 help:
	@grep -E '^\.PHONY: [a-zA-Z_-]+ .*?# .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = "(: |#)"}; {printf "%-30s %s\n", $$2, $$3}'

.PHONY: yarn-ensure # Ensure yarn exists in the project.
yarn-ensure:
	@$(SHELL) install-yarn.sh

.PHONY: yarn-install # Install frontend dependencies.
install: yarn-ensure
	$(YARN) --cwd frontend install --frozen-lockfile
