#!/bin/bash

# See: https://github.com/pi-hole/docker-pi-hole/pull/584
load_password_secret() {
   # If PIHOLE_PASSWORD is not set at all, attempt to read password from PIHOLE_PASSWORD_FILE,
   # allowing secrets to be passed via docker secrets
   if [ -z "${PIHOLE_PASSWORD+x}" ] && [ -n "${PIHOLE_PASSWORD_FILE}" ] && [ -r "${PIHOLE_PASSWORD_FILE}" ]; then
     export PIHOLE_PASSWORD=$(<"${PIHOLE_PASSWORD_FILE}")
   fi;
}

load_password_secret

exec /root/pihole-exporter
