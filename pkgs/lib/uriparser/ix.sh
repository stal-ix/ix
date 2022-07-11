{% extends '//lib/uriparser/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
URIPARSER_BUILD_TOOLS=OFF
{% endblock %}
