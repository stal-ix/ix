{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libwacom
{% endblock %}

{% block version %}
2.16.1
{% endblock %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-{{self.version().strip()}}/libwacom-{{self.version().strip()}}.tar.xz
0f9bc90babad92b2c4c6571b53af3aee065f437cce01c06c860599e1a10680aa
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
