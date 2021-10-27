{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://www.cpan.org/src/5.0/perl-5.34.0.tar.gz
# md5 2acf2ef147e41730e572251ed079bc1a
{% endblock %}

{% block deps %}
# bld lib/z lib/dlfcn lib/gdbm lib/iconv
# bld dev/build/make shell/cli/bash/minimal env/std
{% endblock %}

{% block cflags %}
# too much warnings with clang
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block toolconf %}
cat << EOF > install_name_tool
#!$(which dash)
EOF

chmod +x install_name_tool
{% endblock %}

{% block patch %}
sed -e "s|/usr/bin/||g"             \
    -e "s|/usr/|/nowhere/|g"        \
    -e "s|/bin/sh|$(which dash)|g"  \
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
