{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus/dbus-1.14.10.tar.xz
sha:ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f
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
