{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.9.0/libwacom-2.9.0.tar.xz
sha:6f678156797becc4f1537a19aadcc48ed7a54e1ff3cbf591d1233f8a2d82e242
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
