{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
BUILD_LIBWASM=ON
{% endblock %}
