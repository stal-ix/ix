{% extends 'std/mix.sh' %}

{% block std_box %}
  {% if 'wrap_cc' in build_flags %}
    bld/scripts/wrapcc
  {% endif %}

  {{super()}}
{% endblock %}

{% block setup_tools %}
{% if 'wrap_cc' in build_flags %}
{{hooks.wrap_c_compilers()}}
{% endif %}
{{super()}}{% endblock %}
