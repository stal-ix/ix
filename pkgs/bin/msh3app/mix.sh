{% extends '//lib/msh3/mix.sh' %}

{% block cmake_flags %}
{{super()}}
MSH3_TOOL=ON
{% endblock %}
