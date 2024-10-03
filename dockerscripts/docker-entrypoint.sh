#!/bin/sh

# If command starts with an option, prepend iperf3
if [ "${1}" != "iperf3" ]; then
	if [ -n "${1}" ]; then
		set -- iperf3 "$@"
	fi
fi

exec "$@"
