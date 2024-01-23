{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/intel/thermal_daemon/archive/refs/tags/v2.5.5.tar.gz
sha:d5d6d8213fcfd6f3cf073b993225699154b1e22f6053332830231da5038ce8a9
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
