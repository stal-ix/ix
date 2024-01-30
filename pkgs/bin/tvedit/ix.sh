{% extends '//lib/tvision/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
TV_BUILD_EXAMPLES=ON
{% endblock %}
