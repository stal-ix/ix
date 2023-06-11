{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libadwaita/archive/refs/tags/1.3.3.tar.gz
sha:2d92e587828f75775cf33414bb128ff784312eaa647db87faec4a7bb8998fbc6
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
