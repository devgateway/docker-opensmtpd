#!/bin/sh -e
# Copyright 2019, Development Gateway, see COPYING
: ${OPENSMTPD_RULES:=accept from source <private> for any relay}

cat >/etc/smtpd/smtpd.conf <<EOF
listen on 0.0.0.0
listen on ::

table private { 172.16.0.0/12, 192.168.0.0/16, 10.0.0.0/8, fd00::/8 }

$(echo "$OPENSMTPD_RULES" | sed 's/;[[:space:]]*/\n/g')
EOF

smtpd -n

exec smtpd -dP mda
