{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/intel/thermal_daemon/archive/refs/tags/v2.5.2.tar.gz
sha:9c69588b94a98b4843cd46e3bae570f55020b5e2bf1b417a0c6990f6519070c9
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
