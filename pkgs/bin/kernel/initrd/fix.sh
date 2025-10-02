#!/usr/bin/env sh

set -xue
test -f bin/initrd
mkdir -p tmp/bin
copybin bin tmp/bin
cd tmp
chmod +x bin/*
ln -s bin/initrd init
ln -s . usr
find . | cpio -o -H newc | zstd -9 - > ../bin/initrd.zstd
cd ..
rm -rf tmp
