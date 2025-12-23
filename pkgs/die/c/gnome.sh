{% extends 'meson.sh' %}

{% block std_box %}
{{super()}}
bld/gnome/{{kind}}
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
