{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
glib-networking
{% endblock %}

{% block version %}
2.90.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib-networking/-/archive/{{self.version().strip()}}/glib-networking-{{self.version().strip()}}.tar.bz2
1257d5536066db56b898cb783aa6d7686157a286506e895c4ebac49ecafe2daf
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
