{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gdk-pixbuf
{% endblock %}

{% block version %}
2.42.12
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-{{self.version().strip()}}.tar.xz
sha:b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7
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
