{% extends '//die/std/ix.sh' %}

{% block std_box %}
  {% if 'wrap_cc' in build_flags %}
    bld/wrap/cc
    {% if 'wrap_rdynamic' in build_flags %}
      {% if bin %}
        bld/wrap/cc/plugins/rdynamic
      {% else %}
        bld/wrap/cc/plugins/rdynamic/fake
      {% endif %}
    {% endif %}
  {% endif %}
  {{super()}}
{% endblock %}
