{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://www.cpan.org/src/5.0/perl-5.34.0.tar.gz
2acf2ef147e41730e572251ed079bc1a
{% endblock %}

{% block bld_deps %}
lib/z/mix.sh
lib/dlfcn/mix.sh
lib/gdbm/mix.sh
lib/iconv/mix.sh
dev/build/make/mix.sh
shell/cli/bash/minimal/mix.sh
env/std/mix.sh
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
sed -e "s|/usr/bin/||g"                 \
    -e "s|/usr/|/nowhere/|g"            \
    -e "s|/bin/sh|$(command -v dash)|g" \
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
    -Dcc=gcc
{% endblock %}
