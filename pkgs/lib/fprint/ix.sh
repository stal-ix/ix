{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v1.94.5/libfprint-v1.94.5.tar.bz2
sha:707309cc58012c4c22a318fdb0c6b43b2c96c8e70349ca5edb1feabb65afb63a
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
lib/kernel
{% endblock %}

{% block meson_flags %}
doc=false
introspection=false
udev_rules=disabled
udev_hwdb=disabled
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block patch %}
sed -e 's|.*extern.*stderr.*||' -i libfprint/nbis/include/bozorth.h
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${NSS_HEADERS} ${CPPFLAGS}"
export CONLYFLAGS="-std=c11 ${CONLYFLAGS}"
{% endblock %}
