#!/usr/bin/env sh
set -xue
where=${1}
shift
store=${1}
shift
mount -t tmpfs tmpfs ${where}
cd ${where}
mkdir -p ./${store}
mount --bind ${store} ./${store}
mkdir dev
>dev/null
>dev/zero
>dev/random
>dev/urandom
mount --bind /dev/null dev/null
mount --bind /dev/zero dev/zero
mount --bind /dev/zero dev/random
mount --bind /dev/zero dev/urandom
cp -P /dev/stdin dev/
cp -P /dev/stdout dev/
cp -P /dev/stderr dev/
mkdir proc
mount --bind /proc proc
mkdir bin
cp $(command -v sh) bin/
mkdir -p usr/bin
cp $(command -v env) usr/bin/
mkdir etc
cat << EOF > etc/passwd
root:x:0:0:none:/home/root:/bin/sh
EOF
exec ${@}
