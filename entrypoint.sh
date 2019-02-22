#!/bin/sh -e
: ${OPENSMTPD_LISTEN_ON:=0.0.0.0;::}
if [ "$1" = "opensmtpd" ]; then
  (
    IFS=';'
    for IFACE in $OPENSMTPD_LISTEN_ON; do
      echo "listen on $IFACE"
    done
    echo "$OPENSMTPD_RULES" | sed 's/;[[:space:]]*/\n/g'
  ) >/etc/smtpd/smtpd.conf
  smtpd -n
  exec smtpd -dP mda
else
  exec $@
fi
