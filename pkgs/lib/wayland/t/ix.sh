{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayland
{% endblock %}

{% block version %}
1.23.1
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland/-/archive/{{self.version().strip()}}/wayland-{{self.version().strip()}}.tar.bz2
sha:4afcf2942a39d8276d06dcefc89dfaf029222994778fd4c49aa68a702ebf698f
{% endblock %}

{% block meson_flags %}
documentation=false
tests=false
{% endblock %}

{% block c_rename_symbol %}
os_create_anonymous_file
{% endblock %}
