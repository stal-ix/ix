{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libwacom
{% endblock %}

{% block version %}
2.17.0
{% endblock %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-{{self.version().strip()}}/libwacom-{{self.version().strip()}}.tar.xz
41a0f239841567b101904df8ced81e1e0115334ccfd82a024412aa0903dae5a7
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
