#!/usr/bin/env sh

cat /var/run/syslogd/std/* | sed -e 's|dmesg:|kernel:|' | grep 'kernel:' | sed -e 's|.*kernel: ||'
dmesg
