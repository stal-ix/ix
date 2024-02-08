{% extends 'ix_unwrap.sh' %}

{% block std_box %}
  {% if linux and 'compress' in build_flags %}
    bld/pack
  {% endif %}
  {% if 'fix_shebangs' in build_flags %}
    bld/shebangs
  {% endif %}
  {% if 'fix_cmake_lib' in build_flags %}
    bld/cmake/fix
  {% endif %}
  {% if 'rename_dynlib' in build_flags %}
    bld/rename/dynlib
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
{% if 'fix_cmake_lib' in build_flags %}
fix_cmake_lib ${out}/lib/cmake
{% endif %}
{% endblock %}

{% block purge_dynlib %}
{% if 'rename_dynlib' in build_flags %}
rename_dynlib ${out}/lib
{% endif %}{{super()}}{% endblock %}
