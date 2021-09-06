.DEFAULT_GOAL := help


.PHONY: all
all:


.PHONY: help
help:
	@echo "Usage: make <target> [options]\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Examples:"
	@echo "make create ROLE=vim"
	@echo "make install ROLE=vim"
	@echo "make install-all"


.PHONY: create
create: ## Create ROLE, options: ROLE=<RoleName>
	@_tools/create.sh $(ROLE)


.PHONY: install
install: ## Install ROLE, options: ROLE=<RoleName>
	@_tools/install.sh $(ROLE)


.PHONY: install-all
install-all: ## Install All ROLEs
	@_tools/install_all.sh

