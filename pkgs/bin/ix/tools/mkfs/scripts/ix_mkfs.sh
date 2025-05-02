#!/usr/bin/env sh

set -xue

cd ${IX_DIR}

rm -f /ix/realm/mkfs

./ix mut mkfs set/rootfs set/boot

realm=$(readlink /ix/realm/mkfs)

rm -rf ${1}
mkdir -p ${1}
cd ${1}

mkdir ix
mkdir -m 01777 ix/realm
mkdir -m 01777 ix/trash
mkdir -p ix/store home/ix var sys proc dev

cp -R ${IX_DIR} home/ix/

ix_sync ./ ${realm}

ln -s ${realm} ix/realm/system
ln -s ${realm} ix/realm/boot
ln -s ix/realm/system/bin bin
ln -s ix/realm/system/etc etc
ln -s / usr
