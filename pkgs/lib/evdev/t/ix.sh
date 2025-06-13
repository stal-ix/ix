{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libevdev
{% endblock %}

{% block version %}
1.13.4
{% endblock %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-{{self.version().strip()}}.tar.xz
f00ab8d42ad8b905296fab67e13b871f1a424839331516642100f82ad88127cd
{% endblock %}

{% block meson_flags %}
tests=disabled
documentation=disabled
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}
