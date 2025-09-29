{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnotify
{% endblock %}

{% block version %}
0.8.7
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.8/libnotify-{{self.version().strip()}}.tar.xz
4be15202ec4184fce1ac15997ece5530d2be32fe9573875aeb10e3b573858748
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gdk/pixbuf
{% endblock %}

{% block meson_flags %}
man=false
tests=false
gtk_doc=false
introspection=disabled
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|-DG_LOG_DOMAIN=.*||' -e 's|-Wl,.*||' -i ${out}/lib/pkgconfig/libnotify.pc
{% endblock %}
