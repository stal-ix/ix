{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib-networking/-/archive/2.76.1/glib-networking-2.76.1.tar.bz2
sha:e6f735e1a0072545ae0d485704a6a914a933d0fce08adc9be07dbad799c0fa46
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
