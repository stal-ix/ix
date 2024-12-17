{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dbus.freedesktop.org/releases/dbus/dbus-1.16.0.tar.xz
sha:9f8ca5eb51cbe09951aec8624b86c292990ae2428b41b856e2bed17ec65c8849
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
