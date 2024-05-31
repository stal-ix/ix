{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-1.13.2.tar.xz
sha:3eca86a6ce55b81d5bce910637fc451c8bbe373b1f9698f375c7f1ad0de3ac48
{% endblock %}

{% block meson_flags %}
tests=disabled
documentation=disabled
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/libevdev-1.0 \${CPPFLAGS}"
{% endblock %}
