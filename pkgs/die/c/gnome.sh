{% extends 'meson.sh' %}

{% block std_box %}
bld/glib
bld/gnome
bld/gettext
{{super()}}
{% if bin %}
bld/wrapcc/link/plugins/gnome
{% endif %}
{% endblock %}

{% block build_flags %}
{{super()}}
{% if bin %}
wrap_cc
{% endif %}
{% endblock %}

{% block step_install %}
{% if bin %}
igs-hook
{% endif %}
{{super()}}
{% endblock %}
