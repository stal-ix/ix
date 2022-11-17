{% extends '//die/c/meson.sh' %}

{% block fetch %}
# TODO(pg): 2.42.9-10 broke gtk3 build
https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.6.tar.xz
sha:c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
man=false
relocatable=true
installed_tests=false
gio_sniffing=false
{% endblock %}
