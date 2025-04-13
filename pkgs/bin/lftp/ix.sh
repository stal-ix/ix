{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
lftp
{% endblock %}

{% block version %}
4.9.3
{% endblock %}

{% block fetch %}
https://github.com/lavv17/lftp/releases/download/v{{self.version().strip()}}/lftp-{{self.version().strip()}}.tar.gz
sha:68116cc184ab660a78a4cef323491e89909e5643b59c7b5f0a14f7c2b20e0a29
{% endblock %}

{% block conf_ver %}
2/71
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

{% block cpp_defines %}
error=ix_error
{% endblock %}

{% block patch %}
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
