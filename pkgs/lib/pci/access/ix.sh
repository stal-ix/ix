{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/archive/libpciaccess-0.18/libpciaccess-libpciaccess-0.18.tar.bz2
sha:c087f68008d91ebe0b5e5e77ca8568cf2c1ab35379f55cc098a5e87958808d90
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
