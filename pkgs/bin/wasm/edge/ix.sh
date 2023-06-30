{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
WASMEDGE_BUILD_AOT_RUNTIME=OFF
{% endblock %}
