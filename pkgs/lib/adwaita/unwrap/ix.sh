{% extends '//lib/adwaita/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
vapi=false
introspection=disabled
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
# conflict with gtk
_gtk_builder_parser_translate
_gtk_builder_check_parent
_gtk_builder_prefix_error
_gtk_builder_error_unhandled_tag
{% endblock %}
