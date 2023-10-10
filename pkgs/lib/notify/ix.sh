{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.8/libnotify-0.8.3.tar.xz
sha:ee8f3ef946156ad3406fdf45feedbdcd932dbd211ab4f16f75eba4f36fb2f6c0
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
