#!/bin/bash
A=`ps -C haproxy --no-header | wc -l`
if [ $A -eq 0 ];then
	/usr/local/haproxy/sbin/haproxy -f /usr/local/haproxy/etc/haproxy.cfg
	echo "Haproxy start"
	sleep 3
	if [ `ps -C haproxy --no-header | wc -l` -eq 0 ];then
		/etc/init.d/keepalived stop
		echo"keepalived stop"
	fi
fi

