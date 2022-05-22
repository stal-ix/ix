{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.6.1.tar.bz2
039aae4a55e4a33f4c39b274fcc1dc5e
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
