{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.11.0/libwacom-2.11.0.tar.xz
sha:b03f991ec82c543a42386274e1290c326934e4f25246dc3789ca3037c7181344
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
