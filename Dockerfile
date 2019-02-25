# Copyright 2019, Development Gateway, see COPYING
FROM alpine:3.9

RUN apk add --no-cache opensmtpd tini

COPY entrypoint.sh /
RUN mkdir -m 0711 /var/spool/smtpd
COPY smtpd.conf /etc/smtpd/

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/entrypoint.sh"]

VOLUME /var/spool/smtpd

EXPOSE 25
