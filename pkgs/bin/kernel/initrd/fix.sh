#!/usr/bin/env sh

set -xue
test -f bin/initrd
mkdir -p tmp/bin
copybin bin tmp/bin
cd tmp
cp bin/initrd init
ln -s . usr
ln -s bin sbin
cp init linuxrc
find . | cpio -o -H newc | gzip -9 -n > ../bin/initrd.gz
cd ..
rm -rf tmp
