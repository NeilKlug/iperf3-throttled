FROM alpine:latest
RUN apk add --no-cache iperf3 && \
    apk add --no-cache dumb-init && \
    apk add --no-cache iproute2
EXPOSE 5001
RUN ip a
RUN which iperf3 && \
    which tc
COPY ./dockerscripts/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["dumb-init", "/docker-entrypoint.sh"]
CMD ["iperf3", "-s", "-V", "-d", "-p", "5001"]
