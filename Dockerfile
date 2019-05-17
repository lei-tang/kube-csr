FROM golang:1.10 as builder

COPY . /go/src/github.com/lei-tang/kube-csr

RUN make -C /go/src/github.com/lei-tang/kube-csr re

FROM busybox:latest

COPY --from=builder /go/src/github.com/lei-tang/kube-csr/kube-csr /usr/local/bin/kube-csr
