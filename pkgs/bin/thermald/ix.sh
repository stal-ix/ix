{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
thermal_daemon
{% endblock %}

{% block version %}
2.15.10
{% endblock %}

{% block fetch %}
https://github.com/intel/thermal_daemon/archive/refs/tags/v{{self.version().strip()}}.tar.gz
91f0eb6a471637cd16877be59947048c90912ea80495f78f8c2d4f465f12d6a0
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
