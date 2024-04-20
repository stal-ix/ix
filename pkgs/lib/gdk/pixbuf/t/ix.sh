{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.11.tar.xz
sha:49dcb402388708647e8c321d56b6fb30f21e51e515d0c5a942268d23052a2f00
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
