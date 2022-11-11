{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
enable_cplusplus=OFF
{% endblock %}
