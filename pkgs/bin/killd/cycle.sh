#!/bin/sh

lst() (
    ps -o ppid,pid,args | awk '$1 == 1' | grep -v runsvdir | grep -v sway | grep -v foot
)

lstp() (
    lst | awk '{print $2}'
)

sleep 1

mkdir -p /var/run/killd
cd /var/run/killd

date >> log

lst >> log

for s in "SIGINT" "SIGTERM" "SIGKILL"; do
    lstp | while read l; do
        echo "${s} ${l}" >> log
        kill -${s} ${l}
    done

    sleep 1
done

sleep 10
