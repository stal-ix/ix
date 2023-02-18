{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.8/libnotify-0.8.2.tar.xz
sha:c5f4ed3d1f86e5b118c76415aacb861873ed3e6f0c6b3181b828cf584fc5c616
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
