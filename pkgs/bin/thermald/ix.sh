{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/intel/thermal_daemon/archive/refs/tags/v2.5.3.tar.gz
sha:0ca377c566c2848ee48604bb2ee7f943e3735341aa53ea8ae63cefba46707236
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
