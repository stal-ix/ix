{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://www.cpan.org/src/5.0/perl-5.34.0.tar.gz
# md5 2acf2ef147e41730e572251ed079bc1a
{% endblock %}

{% block deps %}
# bld lib/z/mix.sh
# bld lib/dlfcn/mix.sh
# bld lib/gdbm/mix.sh
# bld lib/iconv/mix.sh
# bld dev/build/make/mix.sh
# bld shell/cli/bash/minimal/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block cflags %}
# too much warnings with clang
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block toolconf %}
cat << EOF > install_name_tool
#!$(command -v dash)
EOF

chmod +x install_name_tool
{% endblock %}

{% block patch %}
sed -e "s|/usr/bin/||g"             \
    -e "s|/usr/|/nowhere/|g"        \
    -e "s|/bin/sh|$(command -v dash)|g"  \
    -i Configure
{% endblock %}

{% block configure %}
bash Configure -des \
    -Dusethreads \
    -Dprefix=${out} \
    -Duseperlio \
    -Uusesfio \
    -Duseshrplib=false \
    -Dusedl=false \
    -Dcc=gcc
{% endblock %}
