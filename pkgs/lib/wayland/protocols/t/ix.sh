{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayland-protocols
{% endblock %}

{% block version %}
1.50
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/{{self.version().strip()}}/wayland-protocols-{{self.version().strip()}}.tar.bz2
dc5899a21274fd03d06472a753d1954ab30ecc6af372105d72d472ba17a65705
{% endblock %}

{% block bld_tool %}
bld/wayland/scanner
{% endblock %}

{% block lib_deps %}
lib/c
lib/ffi
lib/wayland
{% endblock %}
