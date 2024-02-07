{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.10.0/libwacom-2.10.0.tar.xz
sha:3f8ef37de78ac3d08af1bdcb5d5828ec8284dcb7154bbec4995238728914aa0e
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
