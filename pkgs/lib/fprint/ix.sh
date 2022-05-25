{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v1.94.4/libfprint-v1.94.4.tar.bz2
sha:d0c8d6c153abd2c65e6b71ff27eee6bce220c1e1822c24091e87431f167a697f
{% endblock %}

{% block lib_deps %}
lib/c
lib/nss
lib/udev
lib/glib
lib/usb/g
lib/udev/g
lib/pixman
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block meson_flags %}
doc=false
introspection=false
udev_rules=disabled
udev_hwdb=disabled
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}

{% block patch %}
sed -e 's|.*extern.*stderr.*||' -i libfprint/nbis/include/bozorth.h
{% endblock %}

{% block setup %}
export CONLYFLAGS="-std=c11 ${CONLYFLAGS}"
{% endblock %}
