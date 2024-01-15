{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libinput/-/archive/1.25.0/libinput-1.25.0.tar.bz2
sha:193bd592298bd9e369c0ef3e5d83a6a9d68ddc4cd3dfc84bbe77920a8d0d57df
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
lib/mtdev
lib/wacom
lib/evdev
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
