SHELL := /usr/bin/env bash

.DEFAULT_GOAL=ci

.PHONY: shellcheck
shellcheck:
	@./.helpers/shellcheck

.PHONY: shfmt
shfmt:
	@./.helpers/shfmt
	@./.helpers/git-check-dirty

.PHONY: ci
ci: shfmt shellcheck
