{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/upower/upower/-/archive/v1.90.1/upower-v1.90.1.tar.bz2
sha:00fa6b2d69d5178620237546dcbed7d80d7ad809a3a41a9505160057ae360a42
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
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
