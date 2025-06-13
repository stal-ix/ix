{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gdk-pixbuf
{% endblock %}

{% block version %}
2.42.12
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-{{self.version().strip()}}.tar.xz
b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7
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
