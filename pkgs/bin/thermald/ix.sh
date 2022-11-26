{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/intel/thermal_daemon/archive/refs/tags/v2.5.1.tar.gz
sha:75c165df45b3d09c904d314c8c19789158e9538f46e3d2b606457dc631eb3af5
{% endblock %}

{% block bld_libs %}
lib/c
lib/xz
lib/c++
lib/evdev
lib/kernel
lib/xml/2
lib/upower
lib/dbus/glib
{% endblock %}

{% block bld_tool %}
bld/python
bld/gtkdoc
lib/dbus/glib
bld/glib
bld/auto/archive
{% endblock %}

{% block autoreconf %}
export NO_CONFIGURE=1
{{super()}}
{% endblock %}
