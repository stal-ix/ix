{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib-networking/-/archive/2.80.0/glib-networking-2.80.0.tar.bz2
sha:c14cb3c666d2fd0562bee2ea2a43b50d81c47cf62f2159ba1e3895d38ca83044
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
