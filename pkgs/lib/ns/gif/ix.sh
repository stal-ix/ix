{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libnsgif
{% endblock %}

{% block version %}
1.0.0
{% endblock %}

{% block fetch %}
https://download.netsurf-browser.org/libs/releases/libnsgif-{{self.version().strip()}}-src.tar.gz
sha:6014c842f61454d2f5a0f8243d7a8d7bde9b7da3ccfdca2d346c7c0b2c4c061b
{% endblock %}

{% block bld_tool %}
bin/netsurf/buildsystem
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_flags %}
NSSHARED=${NSBS}
COMPONENT_TYPE=lib-static
INCLUDEDIR=include
LIBDIR=lib
{% endblock %}
