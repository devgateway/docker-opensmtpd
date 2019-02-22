#!/bin/sh -e
if [ "$1" = "opensmtpd" ]; then
  smtpd -n
  exec smtpd -dP mda
else
  exec $@
fi
