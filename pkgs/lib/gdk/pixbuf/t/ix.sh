{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gdk-pixbuf
{% endblock %}

{% block version %}
2.44.3
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gdk-pixbuf/archive/refs/tags/{{self.version().strip()}}.tar.gz
cc591e3949a95e2f7b50173c9373df8846648b15aa596d9e7ec7258381bfac0d
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
