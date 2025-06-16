{% extends 'ix2.sh' %}

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
  {% if sanitize and lib and 'san_intercept' in build_flags %}
    bld/redefiner
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
{% if sanitize and lib and 'san_intercept' in build_flags %}
(
    find ${out}/lib -type f -name '*.a'
    find ${out}/lib -type f -name '*.o'
) | while read l; do
    ix_redefiner ${l} ${IX_SANITIZER_INTERCEPT}
done
{% endif %}
{% endblock %}

{% block purge_dynlib %}
{% if 'rename_dynlib' in build_flags %}
rename_dynlib ${out}/lib
{% endif %}
{{super()}}
{% endblock %}
