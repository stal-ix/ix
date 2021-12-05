{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://www.cpan.org/src/5.0/perl-5.34.0.tar.gz
2acf2ef147e41730e572251ed079bc1a
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/gdbm/mix.sh
lib/iconv/mix.sh
{% endblock %}

{% block bld_tool %}
shell/cli/bash/minimal/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block setup %}
# too much warnings with clang
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block toolconf %}
cat << EOF > sw_vers
echo 'ProductName:    macOS'
echo 'ProductVersion:    10.0'
EOF

chmod +x sw_vers

cat << EOF > install_name_tool
#!$(which dash)
EOF

chmod +x install_name_tool
{% endblock %}

{% block patch %}
sed -e "s|/usr/bin/||g"                 \
    -e "s|/usr/|/nowhere/|g"            \
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
{% endblock %}

{% block postinstall %}
# TODO
{% endblock %}
