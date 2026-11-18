{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libksba
{% endblock %}

{% block version %}
1.9.0
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libksba/libksba-{{self.version().strip()}}.tar.bz2
b070f3da9113df3804379f55e10cd00f0bc4993d5392157fecb5fd174a5d58ce
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
