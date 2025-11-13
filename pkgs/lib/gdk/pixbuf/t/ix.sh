{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gdk-pixbuf
{% endblock %}

{% block version %}
2.44.4
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gdk-pixbuf/archive/refs/tags/{{self.version().strip()}}.tar.gz
6de2f77d992155b4121d20036e7e986dfe595a0e654381cdd0d7257f493c208a
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
