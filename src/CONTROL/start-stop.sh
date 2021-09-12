#!/bin/sh

case $1 in

	start)
		# start script here
		echo "Starting nodejs-i386..."
		# [ ! -f /usr/bin/node ] && ln -s /usr/local/bin/node /usr/bin/node
		ln -sf /usr/local/lib64/libstdc++.so.6.0.28 /lib/libstdc++.so.6
		;;

	stop)
		# stop script here
		echo "Stopping nodejs-i386..."
		# [ -f /usr/bin/node ] && rm -f /usr/bin/node
		;;

	*)
		echo "usage: $0 {start|stop}"
		exit 1
		;;
		
esac

exit 0
