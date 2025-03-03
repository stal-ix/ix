#!/usr/bin/env sh

set -xue

where=${1}

shift

store=${1}

shift

rm -rf ${where}
mkdir -p ${where}

cat << EOF > ${where}/0.sh
set -xue
cd ${where}
mkdir -p ./${store}
mkdir dev
cp /dev/null dev/
mkdir bin
cp $(command -v sh) bin/
mkdir -p usr/bin
cp $(command -v env) usr/bin/
mount --bind ${store} ./${store}
ls -la ./${store}
exec \${@}
EOF

unshare -r -U -m setcwd ${PWD} sh ${where}/0.sh chroot ${where} setcwd ${PWD} ${@}
