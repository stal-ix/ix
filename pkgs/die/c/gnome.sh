{% extends 'meson.sh' %}

{% block std_box %}
{{super()}}
{% block gnome_tool %}
bld/gnome/{{kind}}
{% endblock %}
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
