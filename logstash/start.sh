#!/bin/bash

mkdir -p /etc/logstash/ssl

if [ ! -f /etc/logstash/ssl/logstash-forwarder.key -o ! -f /etc/logstash/ssl/logstash-forwarder.crt ] ; then
	cd /etc/logstash/ssl
	/opt/lc-tlscert
	mv selfsigned.crt logstash-forwarder.crt
	mv selfsigned.key logstash-forwarder.key
fi

/opt/logstash-1.4.2/bin/logstash agent -f /etc/logstash/logstash.conf --verbose --debug
