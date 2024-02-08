{% extends '//lib/openal/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ALSOFT_UTILS=OFF
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libopenal.so libopenal.a
{% endblock %}
