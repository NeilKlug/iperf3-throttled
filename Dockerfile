FROM alpine:latest
RUN apk add --no-cache iperf3
EXPOSE 22 5963 5001
RUN ip a
RUN which iperf3
