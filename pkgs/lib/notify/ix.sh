{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnotify
{% endblock %}

{% block version %}
0.8.9
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.8/libnotify-{{self.version().strip()}}.tar.xz
c906bb084027ea512f94a60fbfc0cc8d4f17e4b4d525bed370d07a6d8714c923
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
