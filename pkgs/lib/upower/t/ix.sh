{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
upower
{% endblock %}

{% block version %}
1.90.10
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/upower/upower/-/archive/v{{self.version().strip()}}/upower-v{{self.version().strip()}}.tar.bz2
c1baf418b685ffe4150c8a75c04da0cec70323fe094b5b257b287eea564d3f56
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
