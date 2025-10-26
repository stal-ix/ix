{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libinput
{% endblock %}

{% block version %}
1.29.2
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libinput/-/archive/{{self.version().strip()}}/libinput-{{self.version().strip()}}.tar.bz2
0429db1121ea514eda80038ca74d9ac866c32596e9eff14b2d9453a696e947d1
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
{% if freebsd %}
lib/epoll/shim
{% endif %}
{% endblock %}

{% block meson_flags %}
tests=false
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
