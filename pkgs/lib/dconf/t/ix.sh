{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
dconf
{% endblock %}

{% block version %}
51.0
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/dconf/{{self.version().strip() | field(0)}}/dconf-{{self.version().strip()}}.tar.xz
e65c1b7867f836faad9f9ee04acf5c5a6cae2bbc784833fe093207e0cb590248
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/dbus
{% endblock %}

{% block meson_flags %}
man=false
gtk_doc=false
vapi=false
systemduserunitdir=${out}/tmp
bash_completion=false
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}
