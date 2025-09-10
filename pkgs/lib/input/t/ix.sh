{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libinput
{% endblock %}

{% block version %}
1.29.1
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libinput/-/archive/{{self.version().strip()}}/libinput-{{self.version().strip()}}.tar.bz2
029f40aca33ff006ff28eb8b9359e5d7e9bb7462059f81ff16c471a3cefc3344
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
