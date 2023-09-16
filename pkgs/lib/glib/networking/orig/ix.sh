{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib-networking/-/archive/2.78.0/glib-networking-2.78.0.tar.bz2
sha:d18a78fdbf267dc0271ced4dec9995800d7826c668af5d7d4b96e571cf394eda
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/proxy
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
gnutls=disabled
openssl=enabled
gnome_proxy=disabled
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv gio/modules/*.a ./
rm -r gio
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
