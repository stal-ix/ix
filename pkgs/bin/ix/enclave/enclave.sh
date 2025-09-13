#!/bin/sh

set -xue

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
export IX_SDIR=${TMPDIR}
export XDG_RUNTIME_DIR=${TMPDIR}
mount --rbind /var/mnt/root/dev /dev
mount --rbind /var/mnt/root/sys /sys
mount --rbind /var/mnt/root/proc /proc
mkdir -p /var/run/seatd
mount --rbind /var/mnt/root/var/run/seatd /var/run/seatd
umount -l /var/mnt/root
rmdir /var/mnt/root
rmdir /var/mnt
env
exec "${@}"
