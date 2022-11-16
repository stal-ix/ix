{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-1.13.0.tar.xz
sha:9edf2006cc86a5055279647c38ec923d11a821ee4dc2c3033e8d20e8ee237cd9
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
