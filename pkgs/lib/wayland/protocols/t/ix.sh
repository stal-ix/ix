{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayland-protocols
{% endblock %}

{% block version %}
1.45
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/{{self.version().strip()}}/wayland-protocols-{{self.version().strip()}}.tar.bz2
b73315c26d6c3374c19c2dff7e491f019d8597dc4dcd4473d9181f676f15f48f
{% endblock %}

{% block bld_tool %}
bld/wayland/scanner
{% endblock %}

{% block lib_deps %}
lib/c
lib/ffi
lib/wayland
{% endblock %}
