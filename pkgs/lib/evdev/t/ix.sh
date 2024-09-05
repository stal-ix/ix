{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-1.13.3.tar.xz
sha:abf1aace86208eebdd5d3550ffded4c8d73bb405b796d51c389c9d0604cbcfbf
{% endblock %}

{% block meson_flags %}
tests=disabled
documentation=disabled
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}
