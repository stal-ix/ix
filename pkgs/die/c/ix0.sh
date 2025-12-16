{% extends '//die/std/ix.sh' %}

{% block std_box %}
  {% if 'wrap_cc' in build_flags %}
    bld/wrap/cc
  {% endif %}
  {{super()}}
{% endblock %}
