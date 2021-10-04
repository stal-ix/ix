{% extends '//util/make.sh' %}

{% block fetch %}
# url https://www.cpan.org/src/5.0/perl-5.34.0.tar.gz
# md5 2acf2ef147e41730e572251ed079bc1a
{% endblock %}

{% block deps %}
# bld lib/z lib/gdbm lib/iconv dev/build/make tool/gnu/coreutils/8.32 shell/bash/minimal env/std
{% endblock %}

{% block cflags %}
# too much warnings with clang
export CPPFLAGS="-w ${CPPFLAGS}"

echo > empty.c
gcc -c empty.c -o empty.o
ar q libdl.a empty.o

export LDFLAGS="-L${PWD} ${LDFLAGS}"
{% endblock %}

{% block toolconf %}
cat << EOF > install_name_tool
#!$(which dash)
EOF

chmod +x install_name_tool
{% endblock %}

{% block configure %}
bash ./Configure -des \
    -Dusethreads \
    -Dprefix=${out} \
    -Duseperlio \
    -Uusesfio \
    -Duseshrplib=false \
    -Dusedl=false \
    -Dcc=gcc
{% endblock %}
