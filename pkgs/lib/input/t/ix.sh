{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libinput
{% endblock %}

{% block version %}
1.32.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libinput/-/archive/{{self.version().strip()}}/libinput-{{self.version().strip()}}.tar.bz2
3a6065c07b118c08d0c7b7b85a265ecb050a8cfc91eeb360890d768a51b4cce9
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
