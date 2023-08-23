{% extends '//die/c/meson.sh' %}

{% block fetch %}
#https://github.com/GNOME/libadwaita/archive/refs/tags/1.3.4.tar.gz
#sha:861f6167bbf46152dd740062c10d4bf291c6cda8245553326197df313687f15d
https://github.com/GNOME/libadwaita/archive/refs/tags/1.4.beta.tar.gz
sha:216065f50a7887dfa94313e66b3fdfbaa0f3e337a932fd6d8c978c6b4471bec9
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/4
lib/fribidi
lib/app/stream
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
