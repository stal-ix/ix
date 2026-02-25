{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libksba
{% endblock %}

{% block version %}
1.6.8
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libksba/libksba-{{self.version().strip()}}.tar.bz2
0f4510f1c7a679c3545990a31479f391ad45d84e039176309d42f80cf41743f5
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
