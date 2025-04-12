{% extends '//die/c/meson.sh' %}

{% block version %}
1.23.1
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/wayland/wayland/-/releases/{{self.version().strip()}}/downloads/wayland-{{self.version().strip()}}.tar.xz
sha:864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed
{% endblock %}

{% block meson_flags %}
documentation=false
tests=false
{% endblock %}

{% block c_rename_symbol %}
os_create_anonymous_file
{% endblock %}
