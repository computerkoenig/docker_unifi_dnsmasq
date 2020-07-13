# A mix between: https://github.com/digrouz/docker-alp-dnsmasq
# And: https://github.com/wicol/unifi-dns
FROM python:3.9-rc-alpine

### Environment variables
ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm' 

### Install Application
RUN apk upgrade --no-cache && \
    apk add --no-cache --virtual=run-deps \
      su-exec \
      dnsmasq && \
    rm -rf /tmp/* \
           /var/cache/apk/*  \
           /var/tmp/*

RUN pip install requests

# Expose volumes
VOLUME ["/etc/dnsmasq.d"]

# Expose ports
EXPOSE 53/udp
EXPOSE 53/tcp

### Running User: not used, managed by docker-entrypoint.sh
#USER dnsmasq

COPY ./get_unifi_reservations.py /
### Start dnsmasq
COPY ./docker-entrypoint.sh /
RUN chmod a+x docker-entrypoint.sh && chmod a+x get_unifi_reservations.py
#ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["./docker-entrypoint.sh", "dnsmasq"]
