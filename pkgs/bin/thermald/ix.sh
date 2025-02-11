{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/intel/thermal_daemon/archive/refs/tags/v2.5.9.tar.gz
sha:68c02e23e428e7a4b32e429c1e6862f1b8f37a54538329ef9f9f5639415902dd
{% endblock %}

{% block bld_libs %}
lib/c
lib/xz
lib/c++
lib/evdev
lib/xml/2
lib/kernel
lib/upower
lib/dbus/glib
{% endblock %}

{% block bld_tool %}
bld/glib
bld/python
bld/gtkdoc
lib/dbus/glib
bld/auto/archive
{% endblock %}

{% block autoreconf %}
export NO_CONFIGURE=1
{{super()}}
{% endblock %}

{% block make_flags %}
DBUS_SYS_DIR=${out}/etc/dbus-1
{% endblock %}
