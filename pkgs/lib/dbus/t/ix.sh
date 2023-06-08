{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus/dbus-1.14.8.tar.xz
sha:a6bd5bac5cf19f0c3c594bdae2565a095696980a683a0ef37cb6212e093bde35
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block bld_tool %}
bld/auto/archive
{% endblock %}

{% block configure_flags %}
--with-system-socket="/var/run/dbus/system_bus_socket"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -rf etc var share/dbus-1
{% endblock %}
