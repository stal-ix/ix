{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
TV_BUILD_EXAMPLES=OFF
{% endblock %}
