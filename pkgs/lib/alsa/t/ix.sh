{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.7.tar.bz2
sha:8814e61f7ec6812c76e23a85cab00e0b0d3bba40816af36b726beb1bc04c74a7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block configure_flags %}
--with-libdl
{% endblock %}

{% block patch %}
sed -e 's|safe_strtol_base|safe_strtol_base_xxx|g' \
    -i src/topology/parser.c
{% endblock %}
