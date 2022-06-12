{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libinput/-/archive/1.21.0/libinput-1.21.0.tar.bz2
sha:3173d83e0f5a686606d2780129c802b865b6a0750c86db88d56097afc016a2dd
{% endblock %}

{% block bld_libs %}
lib/linux
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
