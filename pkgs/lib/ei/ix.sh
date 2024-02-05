{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libei/-/archive/1.2.1/libei-1.2.1.tar.bz2
sha:3ea3580fc309c38e064084a0ab4a00dbfa10632efc777dfe1cff007e6082d1dd
{% endblock %}

{% block lib_deps %}
lib/c
lib/basu
lib/evdev
lib/xkb/common
{% endblock %}

{% block bld_libs %}
pip/attrs
pip/jinja2
lib/kernel
{% endblock %}

