{% extends '//lib/freeglut/t/mix.sh' %}

{% block cmake_flags %}
FREEGLUT_BUILD_DEMOS=OFF
{{super()}}
{% endblock %}
