#!/bin/sh

# If command starts with an option, prepend iperf3
if [ "${1}" != "iperf3" ]; then
	if [ -n "${1}" ]; then
		set -- iperf3 "$@"
	fi
fi

# Limit incoming network to 200 mbps
tc qdisc add dev eth0 handle ffff: ingress
tc filter add dev eth0 parent ffff: protocol ip prio 50 u32 match ip src 0.0.0.0/0 police rate 200mbit burst 4m drop flowid :1
# limit outgoing network to 5 mbps
tc qdisc add dev eth0 root tbf rate 5mbit latency 50ms burst 10k

exec "$@"
