{% extends '//lib/sndfile/t/mix.sh' %}

{% block cmake_flags %}
{{super()}}
BUILD_PROGRAMS=OFF
BUILD_EXAMPLES=OFF
ENABLE_CPACK=OFF
{% endblock %}
