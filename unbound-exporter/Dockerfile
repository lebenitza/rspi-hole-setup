FROM golang:alpine3.17 as builder

WORKDIR /build

RUN apk update \
    && apk add git \
    && git clone https://github.com/ar51an/unbound-exporter.git \
    && cd unbound-exporter \
    && go mod tidy \
    && go build

FROM alpine:3.17

COPY --from=builder /build/unbound-exporter/unbound-exporter /usr/local/bin/unbound-exporter

CMD exec /usr/local/bin/unbound-exporter \
    --block-file='' \
    --unbound.uri=$UNBOUND_URI \
    --unbound.server-cert=$UNBOUND_SERVER_CERT_PATH \
    --unbound.control-cert=$UNBOUND_CONTROL_CERT_PATH \
    --unbound.control-key=$UNBOUND_CONTROL_KEY_PATH
