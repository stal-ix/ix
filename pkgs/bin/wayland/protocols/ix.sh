{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wayland-project/wayland-protocols/archive/refs/tags/1.30.tar.gz
sha:1c02ce27d5267c904f2f0d31039265f3e4112f15bf274b1c72bdacd5322f243d
{% endblock %}

{% block bld_tool %}
bin/wayland/scanner
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/wayland
{% endblock %}

{% block strip_pc %}
{% endblock %}
