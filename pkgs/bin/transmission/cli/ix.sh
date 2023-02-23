{% extends '//bin/transmission/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_CLI=ON
{% endblock %}
