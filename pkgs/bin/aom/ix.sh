{% extends '//lib/aom/t/ix.sh' %}

{% block cmake_flags %}
ENABLE_TOOLS=ON
ENABLE_EXAMPLES=ON
{{super()}}
{% endblock %}

{% block cpp_defines %}
{{super()}}
_GNU_SOURCE=1
{% endblock %}
