{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.12.1/libwacom-2.12.1.tar.xz
sha:5b047a28d20b01dd744e194c56c1ba5db54b5d6ee3a8b2d820a1ad6e33d85572
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
