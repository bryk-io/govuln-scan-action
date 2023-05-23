#!/bin/sh -eu

# Configure git to access private Go modules using the
# provided personal access token.
# https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token
# git config --global \
# url."https://${GITHUB_USER}:${ACCESS_TOKEN}@github.com".insteadOf "https://github.com"

# Use the selected version
ln -s /go/bin/govulncheck-${INPUT_GO_VERSION} /usr/local/bin/govulncheck

# Run scan
govulncheck ./...
