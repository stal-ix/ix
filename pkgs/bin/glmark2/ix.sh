{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
glmark2
{% endblock %}

{% block version %}
2023.01
{% endblock %}

{% block fetch %}
https://github.com/glmark2/glmark2/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:8fece3fc323b643644a525be163dc4931a4189971eda1de8ad4c1712c5db3d67
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/jpeg
lib/kernel
lib/opengl
lib/wayland
lib/drivers/3d
{% endblock %}

{% block meson_flags %}
flavors=wayland-gl
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
