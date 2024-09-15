#!/usr/bin/env sh

cat /var/run/syslogd/std/* | grep 'dmesg:' | sed -e 's|.*dmesg: ||'
dmesg
