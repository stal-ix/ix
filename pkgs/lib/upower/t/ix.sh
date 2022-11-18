{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/upower/upower/-/archive/v1.90.0/upower-v1.90.0.tar.bz2
sha:eafa0a367dc0417390984eeb81e9d1a2b449999ba6ad20ed39bf270d0b4e5e77
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
bld/glib/codegen
{% endblock %}

{% block cpp_missing %}
math.h
{% endblock %}
