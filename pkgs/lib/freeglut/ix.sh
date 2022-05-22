{% extends '//lib/freeglut/t/ix.sh' %}

{% block cmake_flags %}
FREEGLUT_BUILD_DEMOS=OFF
{{super()}}
{% endblock %}
