{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libinput/-/archive/1.20.0/libinput-1.20.0.tar.bz2
sha:6c1f97892a7d599f97349e5e7c1239901fe00edcd4f6289f410034d5dc06cc85
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
