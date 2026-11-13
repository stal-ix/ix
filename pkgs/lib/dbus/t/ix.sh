{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dbus
{% endblock %}

{% block version %}
1.16.4
{% endblock %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus/dbus-{{self.version().strip()}}.tar.xz
d08b05526c2cb7966a5fb79210d6112b1aca3d135f315c1b302e14b4b0297dac
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block meson_flags %}
{% if stalix %}
system_socket="/var/run/dbus/system_bus_socket"
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm -rf etc var share/dbus-1
{% endblock %}
