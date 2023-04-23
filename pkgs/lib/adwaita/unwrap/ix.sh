{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libadwaita/archive/refs/tags/1.3.2.tar.gz
sha:5519834dd250cc4f56345566d20447b63878468e22ca19d257f5064a0169828e
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/4
lib/fribidi
{% endblock %}

{% block bld_tool %}
bld/glib
bin/sassc
{% endblock %}

{% block meson_flags %}
vapi=false
introspection=disabled
{% endblock %}

{% block c_rename_symbol %}
# conflict with gtk
_gtk_builder_parser_translate
_gtk_builder_check_parent
_gtk_builder_prefix_error
_gtk_builder_error_unhandled_tag
{% endblock %}
