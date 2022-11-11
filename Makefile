.PHONY: gitconfig-include-local submodule-update start check-requirements composer-get-executable phpactor-install
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables
SHELL := /bin/bash
DIR := ${CURDIR}
nvim := nvim-from-system

.SUFFIXES:

gitconfig-include-local:
	git config --local include.path "$$(git rev-parse --show-toplevel)/.gitconfig"
	
submodule-update:
	git su

composer-get-executable:
	curl -sS https://getcomposer.org/installer | php -- --filename=bin/composer

.ONESHELL:
phpactor-install:
	cd $(DIR)/pack/lsp/opt/phpactor
	$(DIR)/bin/composer install

start: gitconfig-include-local submodule-update composer-get-executable phpactor-install

check-requirements:
	$(DIR)/.config/bin/check-requirements
