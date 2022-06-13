{% extends '//lib/zip/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
BUILD_TOOLS=ON
BUILD_DOC=OFF
{% endblock %}
