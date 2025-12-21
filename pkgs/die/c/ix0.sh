{% extends '//die/std/ix.sh' %}

{% block std_box %}
  {% if 'wrap_cc' in build_flags %}
    bld/wrap/cc
    {% if 'wrap_rdynamic' in build_flags %}
      bld/wrap/cc/plugins/rdynamic
    {% endif %}
    {% if 'wrap_rdynamic_fake' in build_flags %}
      bld/wrap/cc/plugins/rdynamic/fake
    {% endif %}
  {% endif %}
  {{super()}}
{% endblock %}
