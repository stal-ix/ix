{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libinput
{% endblock %}

{% block version %}
1.28.1
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libinput/libinput/-/archive/{{self.version().strip()}}/libinput-{{self.version().strip()}}.tar.bz2
sha:19e5337ec10fdf920c8d1f4ece63cd7d1c12279ee26e347e30e98e2942d9e1aa
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
