{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://www.freedesktop.org/software/libevdev/libevdev-1.11.0.tar.xz
b09838ec120dabeebc08fa6a1943594f
{% endblock %}

{% block meson_flags %}
tests=disabled
documentation=disabled
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
