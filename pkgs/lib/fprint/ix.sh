{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v1.94.8/libfprint-v1.94.8.tar.bz2
sha:50c54514b40b4252cc02460a369af44a6542fbdf772dda5c9c7a699022d29a5d
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

{% block setup_target_flags %}
export CPPFLAGS="-I${NSS_HEADERS} ${CPPFLAGS}"
export CONLYFLAGS="-std=c11 ${CONLYFLAGS}"
{% endblock %}
