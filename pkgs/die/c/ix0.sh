{% extends '//die/std/ix.sh' %}

{% block std_box %}
  {% if 'wrap_cc' in build_flags %}
    bld/wrap/cc
    {% if 'wrap_rdynamic' in build_flags %}
      bld/wrap/cc/plugins/rdynamic
    {% endif %}
  {% endif %}
  {{super()}}
{% endblock %}
