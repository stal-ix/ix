{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gdk-pixbuf
{% endblock %}

{% block version %}
2.44.2
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gdk-pixbuf/archive/refs/tags/{{self.version().strip()}}.tar.gz
90339a000a193383a6d7731dea807bccdfc0610bd185c9a07357fce1c5752969
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
man=false
glycin=disabled
relocatable=true
installed_tests=false
gio_sniffing=false
{% endblock %}

{% block meson_tool %}
bld/meson/6
{% endblock %}
