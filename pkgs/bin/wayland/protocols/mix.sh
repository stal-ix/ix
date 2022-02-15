{% extends '//mix/meson.sh' %}

{% block fetch %}
https://wayland.freedesktop.org/releases/wayland-protocols-1.24.tar.xz
a66fa869543707279fb78a24d42cbb1d
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
