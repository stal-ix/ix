{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libnotify
{% endblock %}

{% block version %}
0.8.8
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.8/libnotify-{{self.version().strip()}}.tar.xz
23420ef619dc2cb5aebad613f4823a2fa41c07e5a1d05628d40f6ec4b35bfddd
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
