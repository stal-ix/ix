{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/upower/upower/-/archive/v1.90.8/upower-v1.90.8.tar.bz2
sha:4a477db7c7e1e434bad6ad78fae13f4579ce97d39008d3cc4e0766530b368a77
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block meson_strip_dirs %}
{% endblock %}

{% block meson_flags %}
man=false
gtk-doc=false
introspection=disabled
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block cpp_missing %}
math.h
{% endblock %}
