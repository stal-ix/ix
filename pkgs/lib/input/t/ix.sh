{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libinput
{% endblock %}

{% block version %}
1.31.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libinput/-/archive/{{self.version().strip()}}/libinput-{{self.version().strip()}}.tar.bz2
af04645cef8ec4ef9b571664828086ea5a610c6f3e872880055c7fe2c9377de5
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
