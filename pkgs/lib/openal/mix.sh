{% extends '//lib/openal/t/mix.sh' %}

{% block cmake_flags %}
{{super()}}
ALSOFT_UTILS=OFF
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libopenal.so libopenal.a
{% endblock %}
