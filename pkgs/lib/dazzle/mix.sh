{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libdazzle/-/archive/3.42.0.1/libdazzle-3.42.0.1.tar.bz2
sha:b82d516ceb74713d4f8fd23e79ba81b073f57c70d1eeb84dc2e28f051f8f5009
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
lib/glib
{% endblock %}

{% block meson_flags %}
with_introspection=false
enable_tests=false
with_vapi=false
{% endblock %}
