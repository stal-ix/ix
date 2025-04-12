{% extends '//die/c/meson.sh' %}

{% block version %}
1.94.9
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v{{self.version().strip()}}/libfprint-v{{self.version().strip()}}.tar.bz2
sha:6f51d9b154c1874b22fff50c288a86584a59dd23b0f6b0a9aa4cdaffb3847ab1
{% endblock %}

{% block lib_deps %}
lib/c
lib/nss
lib/udev
lib/glib
lib/usb/g
lib/udev/g
lib/pixman
lib/openssl
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
