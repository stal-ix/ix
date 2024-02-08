{% extends '//lib/openal/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ALSOFT_UTILS=OFF
{% endblock %}
