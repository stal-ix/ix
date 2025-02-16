#!/usr/bin/env sh

set -xue

name=${1}
version=${2}

mkdir -p ${out}/lib/pkgconfig

cat << EOF > ${out}/lib/pkgconfig/${name}.pc
prefix=${out}
libdir=\${prefix}/lib
includedir=\${prefix}/include
EOF

cat >> ${out}/lib/pkgconfig/${name}.pc

cat << EOF >> ${out}/lib/pkgconfig/${name}.pc
Name: ${name}
Description: stub pc file for ${name}
Version: ${version}
Libs:
Cflags:
EOF

cat ${out}/lib/pkgconfig/${name}.pc
