#!/bin/sh

set -ue

mount -t tmpfs tmpfs /sys

cd /sys

mkdir -p var/mnt/root tmp ix home/${USER}
ln -s ix/realm/${USER}/bin bin
ln -s ix/realm/${USER}/etc etc
mount /ix ix
mount /home/${USER} home/${USER}
mount ${TMPDIR} tmp
ln -s / usr

pivot_root /sys /sys/var/mnt/root

export TMPDIR=/tmp

cd /

mkdir -p dev sys proc var/run
mount --rbind /var/mnt/root/dev /dev
mount --rbind /var/mnt/root/sys /sys
mount --rbind /var/mnt/root/proc /proc

for d in dbus seatd sndiod; do
    mkdir -p /var/run/${d}
    mount --rbind /var/mnt/root/var/run/${d} /var/run/${d}
done

umount -l /var/mnt/root
rmdir /var/mnt/root
rmdir /var/mnt

exec unshare --map-user ${USER} --map-group ${USER} "${@}"
