{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.cpan.org/src/5.0/perl-5.36.0.tar.gz
sha:e26085af8ac396f62add8a533c3a0ea8c8497d836f0689347ac5abd7b7a4e00a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gdbm
lib/iconv
{% endblock %}

{% block bld_tool %}
bld/bash
{% endblock %}

{% block build_flags %}
# too much warnings with clang
shut_up
{% endblock %}

{% block setup_tools %}
cat << EOF > install_name_tool
#!$(which sh)
EOF

cat << EOF > sw_vers
#!$(which sh)
echo "ProductVersion: 10.12"
EOF

chmod +x sw_vers install_name_tool
{% endblock %}

{% block patch %}
chmod 0777 cpan/Compress-Raw-Zlib/config.in

cat << EOF >> cpan/Compress-Raw-Zlib/config.in
BUILD_ZLIB = False
EOF

sed -e "s|/usr/bin/||g"          \
    -e "s|/usr/|/nowhere/|g"     \
    -e "s|/bin/sh|$(which sh)|g" \
    -i Configure
{% endblock %}

{% block configure %}
bash Configure -des    \
    -Dusethreads       \
    -Dprefix="${out}"  \
    -Duseperlio        \
    -Uusesfio          \
    -Duseshrplib=false \
    -Dusedl=false      \
    -Duselibc=c        \
    -Dlibc=c           \
    -Dcc=clang

sed -e 's|/.*/bin/sh|/bin/sh|' -e 's|/.*/bin/sed|sed|' -i config.h
{% endblock %}

{% block postinstall %}
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
