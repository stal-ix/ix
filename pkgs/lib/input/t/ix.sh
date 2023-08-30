{% extends '//die/c/meson.sh' %}

{% block fetch %}
http://distfiles.gentoo.org/distfiles/libinput-1.24.0.tar.bz2
#https://gitlab.freedesktop.org/libinput/libinput/-/archive/1.24.0/libinput-1.24.0.tar.bz2
sha:c07cd0f3f464e8d2e07dc9479fd5b9340e637408517b77e7e96b2245f37f6fe6
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
