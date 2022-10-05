{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus/dbus-1.14.4.tar.xz
sha:7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f659b81b30d4e353e
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
