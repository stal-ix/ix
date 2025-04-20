{% extends '//die/c/make.sh' %}

{% block pkg_name %}
perl
{% endblock %}

{% block version %}
5.36.0
{% endblock %}

{% block fetch %}
https://www.cpan.org/src/5.0/perl-{{self.version().strip()}}.tar.gz
sha:e26085af8ac396f62add8a533c3a0ea8c8497d836f0689347ac5abd7b7a4e00a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gdbm
lib/iconv
lib/shim/fake(lib_name=nsl)
{% endblock %}

{% block bld_tool %}
bld/bash
bld/fake(tool_name=install_name_tool,std_box={{std_box}})
{% endblock %}

{% block build_flags %}
# too much warnings with clang
shut_up
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-int-conversion ${CFLAGS}"
{% endblock %}

{% block patch %}
chmod 0777 cpan/Compress-Raw-Zlib/config.in

cat << EOF >> cpan/Compress-Raw-Zlib/config.in
BUILD_ZLIB = False
EOF

sed -e 's|/lib/libc|/xxx/libc|g' \
    -e "s|/usr/bin/||g"          \
    -e "s|/usr/|/nowhere/|g"     \
    -e "s|/bin/sh|$(which sh)|g" \
    -i Configure
{% endblock %}

{% block configure %}
bash Configure -des        \
    -Dusethreads           \
    -Dprefix="${out}"      \
    -Duseperlio            \
    -Uusesfio              \
    -Duseshrplib=false     \
    -Dusedl=false          \
    -Duselibc=c            \
    -Dlibc=c               \
    -Dcc=clang             \
    -Dglibpth="/nowhere"   \
    -Dplibpth="/nowhere"   \
    -Dxlibpth="/nowhere"   \
    -Dlocincpth="/nowhere" \
    -Dloclibpth="/nowhere"

sed -e 's|/.*/bin/sh|/bin/sh|' -e 's|/.*/bin/sed|sed|' -i config.h

echo '#undef HAS_MALLOC_SIZE' >> config.h
{% endblock %}

{% block postinstall %}
rm -rf ${out}/man
find ${out} | grep Config_heavy.pl | while read l; do
    sed -e 's|#!.*/bin/sh|#!/usr/bin/env sh|' \
        -e 's|/.*build.*tools/||' \
        -e 's|.*sh=.*/bin/sh.*||' \
        -e 's|.*full_sed.*||' \
        -e 's|.*lns=.*||' \
        -e 's|.*rm_try.*||' \
        -i ${l}
done
{% endblock %}
