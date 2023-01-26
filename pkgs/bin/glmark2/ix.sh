{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/glmark2/glmark2/archive/refs/tags/2023.01.tar.gz
sha:8fece3fc323b643644a525be163dc4931a4189971eda1de8ad4c1712c5db3d67
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
lib/jpeg
lib/opengl
lib/wayland
lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
{% endblock %}

{% block meson_flags %}
flavors=wayland-gl
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}
