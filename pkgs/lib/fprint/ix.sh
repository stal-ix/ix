{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v1.94.7/libfprint-v1.94.7.tar.bz2
sha:632ddf4e294b12eb73d5971db7b9ec5e051c52131302fd34f539a20db4b0f9db
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
