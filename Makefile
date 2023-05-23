.PHONY: *
.DEFAULT_GOAL := help

help:
	@echo "Commands available"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /' | sort

## build: Build the action image
build:
	docker build --platform linux/amd64 -t ghcr.io/bryk-io/govuln-scan-action .
