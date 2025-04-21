{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libnsgif
{% endblock %}

{% block version %}
0.2.1
{% endblock %}

{% block fetch %}
https://download.netsurf-browser.org/libs/releases/libnsgif-{{self.version().strip()}}-src.tar.gz
sha:9eaea534cd70b53c5aaf45317ae957701685a6b4a88dbe34ed26f4faae879a4b
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
