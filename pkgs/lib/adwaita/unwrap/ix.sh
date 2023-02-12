{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libadwaita/archive/refs/tags/1.3.beta.tar.gz
sha:a77379fee96377f4264d8350793bfbd55343574d16d5d1fc1de4016dba53f755
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
