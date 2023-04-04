{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz
sha:1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842
{% endblock %}

{% block meson_flags %}
documentation=false
tests=false
{% endblock %}

{% block c_rename_symbol %}
os_create_anonymous_file
{% endblock %}
