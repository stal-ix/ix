{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-1.13.1.tar.xz
sha:06a77bf2ac5c993305882bc1641017f5bec1592d6d1b64787bad492ab34f2f36
{% endblock %}

{% block meson_flags %}
tests=disabled
documentation=disabled
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/libevdev-1.0 \${CPPFLAGS}"
{% endblock %}
