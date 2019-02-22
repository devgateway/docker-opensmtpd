# Copyright 2019, Development Gateway, see COPYING
FROM alpine:3.9

RUN apk add --no-cache opensmtpd

COPY entrypoint.sh /
RUN mkdir -m 0711 /var/spool/smtpd

ENTRYPOINT ["/entrypoint.sh"]
CMD ["opensmtpd"]

VOLUME /var/spool/smtpd

EXPOSE 25
