{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libksba
{% endblock %}

{% block version %}
1.9.1
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libksba/libksba-{{self.version().strip()}}.tar.bz2
9afdd398b4a076735e1e7fd29c7f6e7670b6c382aee2d3a55aa937b283f43e5b
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
