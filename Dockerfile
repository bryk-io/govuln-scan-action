FROM golang:1.20-alpine

COPY bin/* /go/bin/

COPY scan.sh /bin/scan

RUN \
  apk add git && \
  chmod +x /bin/scan

ENTRYPOINT ["/bin/scan"]
