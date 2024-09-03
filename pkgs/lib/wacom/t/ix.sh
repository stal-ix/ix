{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.13.0/libwacom-2.13.0.tar.xz
sha:acd18121441bbc00fc5c881fca08a33319ab814b798eac8d0be6354923f8fb08
{% endblock %}

{% block lib_deps %}
lib/c
lib/evdev
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
