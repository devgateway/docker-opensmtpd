#!/bin/sh -e
# Copyright 2019, Development Gateway, see COPYING
: ${OPENSMTPD_LISTEN_ON:=0.0.0.0;::}
: ${OPENSMTPD_RULES:=accept from source <private> for any relay}
(
  IFS=';'
  for IFACE in $OPENSMTPD_LISTEN_ON; do
    echo "listen on $IFACE"
  done
  echo 'table private { 172.16.0.0/12, 192.168.0.0/16, 10.0.0.0/8, fd00::/8 }'
  echo "$OPENSMTPD_RULES" | sed 's/;[[:space:]]*/\n/g'
) >/etc/smtpd/smtpd.conf
smtpd -n
exec smtpd -dP mda
