{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gdk-pixbuf
{% endblock %}

{% block version %}
2.42.6
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-{{self.version().strip()}}.tar.xz
sha:c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f
#segfaults waybar, epiphany
#https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.11.tar.xz
#sha:49dcb402388708647e8c321d56b6fb30f21e51e515d0c5a942268d23052a2f00
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
man=false
relocatable=true
installed_tests=false
gio_sniffing=false
{% endblock %}
