#!/bin/sh

mount -t tmpfs tmpfs /sys
cd /sys
mkdir -p var/mnt/root var/tmp ix home/pg
ln -s ix/realm/pg/bin bin
ln -s ix/realm/pg/etc etc
mount /ix ix
mount /home/pg home/pg
mount ${TMPDIR} var/tmp
ln -s / usr
pivot_root /sys /sys/var/mnt/root
cd /
mkdir -p dev sys proc var/run var/log
export TMPDIR=/var/tmp
/var/mnt/root/bin/mount -t proc proc proc
/var/mnt/root/bin/mount --rbind /var/mnt/root/dev /dev
/var/mnt/root/bin/mount --rbind /var/mnt/root/sys /sys
/var/mnt/root/bin/umount -l /var/mnt/root
rmdir /var/mnt/root
rmdir /var/mnt
exec "${@}"
