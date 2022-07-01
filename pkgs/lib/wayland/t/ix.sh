{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.21.0/downloads/wayland-1.21.0.tar.xz
sha:6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac
{% endblock %}

{% block meson_flags %}
documentation=false
tests=false
{% endblock %}

{% block c_rename_symbol %}
os_create_anonymous_file
{% endblock %}
