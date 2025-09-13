#!/bin/sh

mount -t tmpfs tmpfs /sys
cd /sys
mkdir -p var/mnt/root var/tmp ix home/${USER}
ln -s ix/realm/${USER}/bin bin
ln -s ix/realm/${USER}/etc etc
mount /ix ix
mount /home/${USER} home/${USER}
mount ${TMPDIR} var/tmp
ln -s / usr
pivot_root /sys /sys/var/mnt/root
cd /
mkdir -p dev sys proc var/run
export TMPDIR=/var/tmp
/var/mnt/root/bin/mount -t proc proc proc
/var/mnt/root/bin/mount --rbind /var/mnt/root/dev /dev
/var/mnt/root/bin/mount --rbind /var/mnt/root/sys /sys
/var/mnt/root/bin/umount -l /var/mnt/root
rmdir /var/mnt/root
rmdir /var/mnt
exec "${@}"
