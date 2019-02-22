# Copyright 2019, Development Gateway, see COPYING
FROM alpine:3.9

RUN apk add --no-cache opensmtpd

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["opensmtpd"]

VOLUME /var/spool/smtpd

EXPOSE 25
