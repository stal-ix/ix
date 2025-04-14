{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dbus
{% endblock %}

{% block version %}
1.16.2
{% endblock %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus/dbus-{{self.version().strip()}}.tar.xz
sha:0ba2a1a4b16afe7bceb2c07e9ce99a8c2c3508e5dec290dbb643384bd6beb7e2
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block meson_flags %}
system_socket="/var/run/dbus/system_bus_socket"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -rf etc var share/dbus-1
{% endblock %}
