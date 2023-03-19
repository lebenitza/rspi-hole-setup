FROM ekofr/pihole-exporter:v0.4.0 as source

FROM alpine:3.17

RUN apk update --no-cache && apk add bash

COPY --from=source /root/pihole-exporter /root/pihole-exporter
COPY start.sh /root/start.sh

CMD /root/start.sh