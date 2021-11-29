{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://wayland.freedesktop.org/releases/wayland-protocols-1.24.tar.xz
a66fa869543707279fb78a24d42cbb1d
{% endblock %}

{% block lib_deps %}
lib/wayland/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}
