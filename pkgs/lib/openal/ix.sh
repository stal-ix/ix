{% extends '//lib/openal/t/ix.sh' %}

{% block build_flags %}
{{super()}}
rename_dynlib
{% endblock %}

{% block cmake_flags %}
{{super()}}
ALSOFT_UTILS=OFF
{% endblock %}
