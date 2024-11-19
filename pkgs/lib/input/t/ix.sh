{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libinput/-/archive/1.27.0/libinput-1.27.0.tar.bz2
sha:8e823cc9f44c51b63ae90af0b73676ed82c0402cc1cbd4a59ac91b7bb6cad716
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
