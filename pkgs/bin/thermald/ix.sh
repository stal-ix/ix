{% extends '//die/c/autorehell.sh' %}

{% block version %}
2.5.9
{% endblock %}

{% block fetch %}
https://github.com/intel/thermal_daemon/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:32fc75861e5e42b4b6ce0718af3e5b275f3febfccf6e7a3d3fbb5254791d7e74
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
