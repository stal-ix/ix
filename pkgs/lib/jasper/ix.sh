{% extends '//lib/jasper/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
JAS_ENABLE_PROGRAMS=OFF
{% endblock %}
