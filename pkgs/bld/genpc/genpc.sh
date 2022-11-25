#!/usr/bin/env sh

set -xue

name=${1}
version=${2}

mkdir -p ${out}/lib/pkgconfig

cat << EOF > ${out}/lib/pkgconfig/${name}.pc
prefix=${out}
libdir=\${prefix}/lib
includedir=\${prefix}/include

Name: ${name}
Description: stub pc file for ${name}
Version: ${version}
Libs:
Cflags:
EOF
