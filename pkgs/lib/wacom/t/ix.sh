{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.8.0/libwacom-2.8.0.tar.xz
sha:bb04b12c8688d0ff6a108d47a38d2057d572c4d7227d78138abd5fd0ba59f215
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
