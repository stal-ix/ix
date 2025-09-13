#!/bin/sh

mount -t tmpfs tmpfs /sys

cd /sys

mkdir -p var/mnt/root tmp ix home/${USER}
ln -s ${USER} home/root
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
mkdir -p /var/run/seatd
mount --rbind /var/mnt/root/var/run/seatd /var/run/seatd
umount -l /var/mnt/root
rmdir /var/mnt/root
rmdir /var/mnt

exec "${@}"
