{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
SDL2TTF_SAMPLES=OFF
{% endblock %}
