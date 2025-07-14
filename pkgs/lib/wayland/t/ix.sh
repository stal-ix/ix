{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wayland
{% endblock %}

{% block version %}
1.24.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland/-/archive/{{self.version().strip()}}/wayland-{{self.version().strip()}}.tar.bz2
ef9224f1a8b6dbd3049a2e51a547abb7e89612414c192a4349f3c83c7f553672
{% endblock %}

{% block meson_flags %}
documentation=false
tests=false
{% endblock %}

{% block c_rename_symbol %}
os_create_anonymous_file
{% endblock %}
