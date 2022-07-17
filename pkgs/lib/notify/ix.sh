{% extends '//die/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.8/libnotify-0.8.1.tar.xz
sha:d033e6d4d6ccbf46a436c31628a4b661b36dca1f5d4174fe0173e274f4e62557
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
