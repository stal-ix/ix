{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/lavv17/lftp/releases/download/v4.8.3/lftp-4.8.3.tar.gz
sha:cfbbbd067c25ff9d629828a010cc700214859b02e33b2405dfe7ed045d080f0f
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/expat
lib/gnutls
lib/readline
lib/shim/gnu
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/bison
bld/gettext
{% endblock %}

{% block cpp_includes %}
${PWD}/lib
${PWD}/trio
{% endblock %}

{% block cpp_defines %}
error=ix_error
{% endblock %}

{% block cpp_missing %}
${PWD}/lib/config.h
{% endblock %}

{% block patch %}
>lib/config.h
>lib/unistr/u8-uctomb-aux.c
sed -e 's|? 1 ; -1|? 1 : -1|' -i trio/trionan.c
{% endblock %}

{% block configure %}
{{super()}}
cat << EOF > po/Makefile
all:
install:
EOF
{% endblock %}
