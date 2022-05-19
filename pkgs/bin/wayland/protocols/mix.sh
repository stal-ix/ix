{% extends '//mix/meson.sh' %}

{% block fetch %}
#https://wayland.freedesktop.org/releases/wayland-protocols-1.24.tar.xz
#a66fa869543707279fb78a24d42cbb1d
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/1.25/wayland-protocols-1.25.tar.bz2
sha:633c9bed0efb8e773c5780d4442051264d179c154b7d1896ca3b56b5d4da4718
{% endblock %}

{% block bld_tool %}
bin/wayland/scanner
{% endblock %}

{% block run_deps %}
bin/wayland/scanner
{% endblock %}

{% block bld_libs %}
lib/c
lib/ffi
lib/wayland
{% endblock %}

{% block strip_pc %}
{% endblock %}
