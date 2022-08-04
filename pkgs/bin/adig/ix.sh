{% extends '//lib/c-ares/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
CARES_BUILD_TOOLS=ON
{% endblock %}
