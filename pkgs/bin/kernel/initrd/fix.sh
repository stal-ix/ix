#!/usr/bin/env sh

set -xue
test -f bin/initrd
mkdir -p tmp/bin
copybin bin tmp/bin
cd tmp
ln -s bin/initrd init
find . | cpio -o -H newc | gzip -9 -n > ../bin/initrd.gz
cd ..
rm -rf tmp
