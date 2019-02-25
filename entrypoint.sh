#!/bin/sh -e
# Copyright 2019, Development Gateway, see COPYING

: ${OPENSMTPD_RULES:=accept from source <trusted> for any relay}
echo "$OPENSMTPD_RULES" | sed 's/;[[:space:]]*/\n/g' >>/etc/smtpd/smtpd.conf

smtpd -n
exec smtpd -dP mda
