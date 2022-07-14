{% extends '//die/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.8/libnotify-0.8.0.tar.xz
sha:46a26f0db4e64cf24016291eb1579ed9f0ba7611fe6cd9e1afec8f42780d3924
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block meson_flags %}
introspection=disabled
man=false
gtk_doc=false
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|-DG_LOG_DOMAIN=.*||' -e 's|-Wl,.*||' -i ${out}/lib/pkgconfig/libnotify.pc
{% endblock %}
