#!/usr/bin/env sh

set -xue

cd ${IX_DIR}

rm -f /ix/realm/mkfs

./ix mut mkfs set/rootfs set/boot/all set/install

realm=$(readlink /ix/realm/mkfs)

rm -rf ${TMPDIR}/mkfs || sudo rm -rf ${TMPDIR}/mkfs
mkdir -p ${TMPDIR}/mkfs
cd ${TMPDIR}/mkfs

mkdir ix
mkdir -m 01777 ix/realm
mkdir -m 01777 ix/trash
mkdir -p ix/store home/ix var sys proc dev

cp -R ${IX_DIR} home/ix/

ix_sync ./ ${realm}

ln -s ${realm} ix/realm/boot
ln -s ${realm} ix/realm/system
ln -s ${realm} ix/realm/install
ln -s ix/realm/system/bin bin
ln -s ix/realm/system/etc etc
ln -s / usr

bsdtar --uid 1000 --uname ix --gid 1000 --gname ix -cf ${1}/mkfs.tar .
