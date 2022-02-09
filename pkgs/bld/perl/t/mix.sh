{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://www.cpan.org/src/5.0/perl-5.34.0.tar.gz
2acf2ef147e41730e572251ed079bc1a
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

{% block setup %}
# too much warnings with clang
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block setup_tools %}
cat << EOF > install_name_tool
#!$(which sh)
EOF

chmod +x install_name_tool
{% endblock %}

{% block patch %}
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

(
    cat config.h | grep -v 'define SH_PATH'

    cat << EOF
#define SH_PATH "$(which sh)"
EOF
) > _ && mv _ config.h
{% endblock %}

{% block postinstall %}
find ${out} | grep Config_heavy.pl | while read l; do
    cat ${l} | sed -e 's|/.*build.*tools/||' | grep -v 'startsh=' > _ && mv _ ${l}
done
{% endblock %}
