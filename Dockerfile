FROM golang:1.18-alpine

COPY scan.sh /bin/scan

RUN \
	go install golang.org/x/vuln/cmd/govulncheck@latest && \
	chmod +x /bin/scan

ENTRYPOINT ["/bin/scan"]
