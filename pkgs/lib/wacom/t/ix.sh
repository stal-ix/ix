{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libwacom
{% endblock %}

{% block version %}
2.19.1
{% endblock %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-{{self.version().strip()}}/libwacom-{{self.version().strip()}}.tar.xz
a1e5b1e7ef60fa70ed05b55d888d980ec7e86bd15594857f3c48c529b661bf32
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
