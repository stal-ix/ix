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
mount --bind /dev/random dev/random
mount --bind /dev/urandom dev/urandom
cp -P /dev/stdin dev/
cp -P /dev/stdout dev/
cp -P /dev/stderr dev/
mkdir dev/shm
mount --bind /dev/shm dev/shm
mkdir proc
mount --bind /proc proc
mkdir bin
cp $(command -v sh) bin/
mkdir -p usr/bin
cp $(command -v env) usr/bin/
mkdir etc
cp -L /etc/resolv.conf etc/
cp -R /etc/ssl etc/
cat << EOF > etc/passwd
root:x:0:0:none:/home/root:/bin/sh
EOF
cat << EOF > etc/group
root:x:0:
EOF
exec chroot ${where} "${@}"
