{% extends 'meson.sh' %}

{% block std_box %}
bld/glib
bld/gnome
{{super()}}
{% endblock %}

{% block step_install %}
{% if bin %}
igs-hook
{% endif %}
{{super()}}
{% endblock %}
