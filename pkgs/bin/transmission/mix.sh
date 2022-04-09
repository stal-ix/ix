{% extends '//bin/transmission/t/mix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_CLI=ON
{% endblock %}
