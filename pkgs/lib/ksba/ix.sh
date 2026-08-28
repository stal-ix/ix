{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libksba
{% endblock %}

{% block version %}
1.8.1
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libksba/libksba-{{self.version().strip()}}.tar.bz2
c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5
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
