{% extends 'meson.sh' %}

{% block std_box %}
{% if bin %}
bld/wrapcc/link/xxx
bld/wrapcc/link/new
{% endif %}
bld/glib
bld/gnome
{{super()}}
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
