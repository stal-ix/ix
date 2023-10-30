{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
PODOFO_BUILD_LIB_ONLY=ON
{% endblock %}
