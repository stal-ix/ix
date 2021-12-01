{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/json-glib/-/archive/1.6.6/json-glib-1.6.6.tar.bz2
cd56648d96dd79197c6d6af153d0e8ae
{% endblock %}

{% block bld_tool %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
lib/glib/bin/mix.sh
{% endblock %}

{% block lib_deps %}
lib/glib/mix.sh
{% endblock %}

{% block meson_flags %}
-Dtests=false
{% endblock %}
