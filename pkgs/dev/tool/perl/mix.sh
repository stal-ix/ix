{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://www.cpan.org/src/5.0/perl-5.34.0.tar.gz
2acf2ef147e41730e572251ed079bc1a
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
lib/z/mix.sh
lib/gdbm/mix.sh
lib/iconv/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/bash/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block setup %}
# too much warnings with clang
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block setup_tools %}
cat << EOF > install_name_tool
#!$(which dash)
EOF

chmod +x install_name_tool
{% endblock %}

{% block patch %}
sed -e "s|/usr/bin/||g"            \
    -e "s|/usr/|/nowhere/|g"       \
    -e "s|/bin/sh|$(which dash)|g" \
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
#define SH_PATH "$(which dash)"
EOF
) > _ && mv _ config.h
{% endblock %}

{% block postinstall %}
find ${out} | grep Config_heavy.pl | while read l; do
    cat ${l} | sed -e 's|/.*build.*tools/||' | grep -v 'startsh=' > _ && mv _ ${l}
done
{% endblock %}

{% block build %}
if which perl; then
    make -j ${make_thrs} miniperl

    cat << EOF > miniperl
#!$(which dash)
perl -I${PWD} "\$@"
EOF

    chmod +x miniperl
fi

{{super()}}
{% endblock %}
