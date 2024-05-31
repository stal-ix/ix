{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.23.0/downloads/wayland-1.23.0.tar.xz
sha:05b3e1574d3e67626b5974f862f36b5b427c7ceeb965cb36a4e6c2d342e45ab2
{% endblock %}

{% block meson_flags %}
documentation=false
tests=false
{% endblock %}

{% block c_rename_symbol %}
os_create_anonymous_file
{% endblock %}
