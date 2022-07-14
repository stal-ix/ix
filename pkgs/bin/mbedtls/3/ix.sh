{% extends '//lib/mbedtls/3/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_PROGRAMS=ON
ENABLE_TESTING=OFF
{% endblock %}
