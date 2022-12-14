# GitHub Action: Go Vulnerabilities Scan

[![Status](https://github.com/bryk-io/govuln-scan-action/actions/workflows/publish.yml/badge.svg)](https://github.com/bryk-io/govuln-scan-action/actions/workflows/publish.yml)
[![Version](https://img.shields.io/github/tag/bryk-io/govuln-scan-action.svg)](https://github.com/bryk-io/govuln-scan-action/releases)
[![Software License](https://img.shields.io/badge/license-BSD3-red.svg)](LICENSE)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0-ff69b4.svg)](.github/CODE_OF_CONDUCT.md)

Go provides tooling to analyze your codebase and surface known vulnerabilities. This
tooling is backed by the Go vulnerability database, which is curated by the Go security
team. Go’s tooling reduces noise in your results by only surfacing vulnerabilities in
functions that your code is actually calling.

More information: [Vulnerability Management for Go](https://go.dev/blog/vuln).

## Usage

Sample step configuration.

```yaml
steps:
  # Vulnerabilities scan
  - name: Go vulnerabilities scan
    uses: bryk-io/govuln-scan-action@v0.1.0
```

## Workflow

Sample workflow file.

```yaml
name: scan
on:
  # To manually run
  workflow_dispatch: {}
  # To automatically run for all commits on branch 'main'
  push:
    branches:
      - main
jobs:
  # GoKart scan
  scan:
    runs-on: ubuntu-latest
    timeout-minutes: 10
    steps:
      # Checkout code
      - name: Checkout repository
        uses: actions/checkout@v3

      # Vulnerabilities scan
      - name: Go vulnerabilities scan
        uses: bryk-io/govuln-scan-action@v0.1.0
```

To manually trigger this workflow using GitHub's CLI tool.

```shell
gh workflow run scan
```
