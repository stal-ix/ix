{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/libnotify/0.7/libnotify-0.7.10.tar.xz
sha:37dc47dd1bd3c1360d6e8815c3affb99d120e3617d7e5647586f117cffe0ba4b
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
