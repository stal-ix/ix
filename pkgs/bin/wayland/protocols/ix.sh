{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wayland-project/wayland-protocols/archive/refs/tags/1.28.tar.gz
sha:914dfa09e7e866e913b27d2d9bda0e20e728c7b1c831fd3db71538d9f99a4869
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
