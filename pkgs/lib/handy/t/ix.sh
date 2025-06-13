{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libhandy
{% endblock %}

{% block version %}
1.8.3
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libhandy/-/archive/{{self.version().strip()}}/libhandy-{{self.version().strip()}}.tar.bz2
1c8403a467bdd16b84bb423573fc0da4b7bc2ba74dc1729ac5e385de35b662b7
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
glade_catalog=disabled
{% endblock %}
