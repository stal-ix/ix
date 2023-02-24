{% extends 't/ix.sh' %}

{% block cmake_flags %}
ENABLE_LIB_ONLY=ON
{{super()}}
{% endblock %}
