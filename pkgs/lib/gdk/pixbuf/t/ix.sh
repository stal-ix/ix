{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gdk-pixbuf
{% endblock %}

{% block version %}
2.44.8
{% endblock %}

{% block fetch %}
https://github.com/GNOME/gdk-pixbuf/archive/refs/tags/{{self.version().strip()}}.tar.gz
115046cd8f84b703da9d20f1527a8d21685c17090eae0afb6bf25ca1ccd4e430
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
