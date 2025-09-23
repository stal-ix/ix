{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libpanel
{% endblock %}

{% block version %}
1.10.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libpanel/-/archive/{{self.version().strip()}}/libpanel-{{self.version().strip()}}.tar.bz2
cbc69348edc3385d36c9af2770c12f6214f6700b52957aa1e1665aee9662233d
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/adwaita
{% endblock %}

{% block meson_flags %}
docs=disabled
introspection=disabled
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gnome
bld/gettext
{% endblock %}
