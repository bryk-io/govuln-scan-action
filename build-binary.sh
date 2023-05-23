#!/bin/bash

# Build the `govulncheck` binary for a given Go version.
# example: build-binary.sh 1.18

# write dockerfile
cat <<EOF > builder-$1
FROM golang:$1-alpine

RUN go install golang.org/x/vuln/cmd/govulncheck@latest
EOF

# build and copy binary
docker build -f builder-$1 --platform linux/amd64 -t govuln-builder-$1 .
docker run -dit --rm --platform linux/amd64 --name govuln-builder-$1 govuln-builder-$1
docker cp govuln-builder-$1:/go/bin/govulncheck bin/govulncheck-$1

# cleanup
docker stop govuln-builder-$1 # container
docker rmi govuln-builder-$1 # image
rm builder-$1 # dockerfile
