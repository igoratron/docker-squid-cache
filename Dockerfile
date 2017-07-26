FROM alpine

RUN apk update && \
    apk add squid && \
    apk add perl

RUN /usr/lib/squid/ssl_crtd -c -s /var/lib/ssl_db && \
    chown squid: /var/lib/ssl_db

ADD certs/ /etc/squid/certs
ADD storeid_db /etc/squid
ADD squid.conf /etc/squid

RUN squid -z -N

ENTRYPOINT ["squid"]
