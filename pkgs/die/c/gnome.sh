{% extends 'meson.sh' %}

{% block std_box %}
bld/glib/codegen
bld/gnome
{{super()}}
{% endblock %}

{% block step_install %}
{% if bin %}
igs-hook
{% endif %}
{{super()}}
{% endblock %}
