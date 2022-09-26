{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus/dbus-1.14.2.tar.xz
sha:07351839a36b3c833b3afe405c4420e7ee367f2ecf57c7ac3633e53110d799fa
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
