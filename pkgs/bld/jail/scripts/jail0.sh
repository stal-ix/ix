#!/usr/bin/env sh
set -xue
where=${1}
shift
store=${1}
shift
mount -t tmpfs tmpfs ${where}
cd ${where}
mkdir -p ./${store}
mkdir dev
cp /dev/null dev/
cp -P /dev/stdin dev/
cp -P /dev/stdout dev/
cp -P /dev/stderr dev/
mkdir proc
mount --bind /proc proc
mkdir bin
cp $(command -v sh) bin/
mkdir -p usr/bin
cp $(command -v env) usr/bin/
mount --bind ${store} ./${store}
ls -la ./${store}
exec ${@}
