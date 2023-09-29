{% extends 'ix_unwrap.sh' %}

{% block std_box %}
  {% if linux and 'compress' in build_flags %}
    bld/pack
  {% endif %}
  {% if 'fix_shebangs' in build_flags %}
    bld/shebangs
  {% endif %}
  {{super()}}
{% endblock %}

{% block step_install %}
{{super()}}
{% if linux and 'compress' in build_flags %}
find ${out}/bin -type f -executable | while read l; do
    packexe "${l}"
done
{% endif %}
{% if 'fix_shebangs' in build_flags %}
find ${out}/bin -type f | while read l; do
    fix_shebangs "${l}"
done
{% endif %}
{% endblock %}
