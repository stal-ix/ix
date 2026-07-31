{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayland-protocols
{% endblock %}

{% block version %}
1.49
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/{{self.version().strip()}}/wayland-protocols-{{self.version().strip()}}.tar.bz2
7330d2d8fbda81991548738e81da493829bc55db2daf1ae15b9d4952e4d7d83b
{% endblock %}

{% block bld_tool %}
bld/wayland/scanner
{% endblock %}

{% block lib_deps %}
lib/c
lib/ffi
lib/wayland
{% endblock %}
