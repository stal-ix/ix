{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libadwaita/-/archive/1.2.1/libadwaita-1.2.1.tar.bz2
sha:ee7fa58d0b8dffe36bb477bf72a84d065cb530b070c8197ea9004740552fe655
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
