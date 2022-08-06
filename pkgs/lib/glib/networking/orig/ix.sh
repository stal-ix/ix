{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib-networking/-/archive/2.72.2/glib-networking-2.72.2.tar.bz2
sha:889707cec796512228decc4bec80579f47a1c762eb1d0614076511c45f7844f3
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/openssl
{% endblock %}

{% block meson_flags %}
openssl=enabled
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib
mv gio/modules/*.a ./
rm -r gio
{% endblock %}
