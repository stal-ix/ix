{% extends '//lib/openal/t/ix.sh' %}

{% block build_flags %}
{{super()}}
fix_cmake_lib
{% endblock %}

{% block cmake_flags %}
{{super()}}
ALSOFT_UTILS=OFF
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libopenal.so libopenal.a
{% endblock %}
