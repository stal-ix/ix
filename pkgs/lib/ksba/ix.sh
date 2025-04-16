{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libksba
{% endblock %}

{% block version %}
1.6.7
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libksba/libksba-{{self.version().strip()}}.tar.bz2
sha:cf72510b8ebb4eb6693eef765749d83677a03c79291a311040a5bfd79baab763
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
