{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.5.tar.bz2
sha:a564628c574c99287998753f98d750babd91a4e9db451f46ad140466ef2a6d16
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/bash
bld/bison
{% endblock %}

{% block postinstall %}
echo 'left bin/*config'
{% endblock %}

{% block env %}
export COFLAGS="--with-libksba-prefix=${out} \${COFLAGS}"
{% endblock %}
