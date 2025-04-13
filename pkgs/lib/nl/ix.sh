{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libnl
{% endblock %}

{% block version %}
3.11.0
{% endblock %}

{% block fetch %}
https://github.com/thom311/libnl/releases/download/libnl3_11_0/libnl-{{self.version().strip()}}.tar.gz
sha:2a56e1edefa3e68a7c00879496736fdbf62fc94ed3232c0baba127ecfa76874d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/libnl3 \${CPPFLAGS}"
{% endblock %}
