{% extends '//lib/svt/av1/t/ix.sh' %}

{% block cmake_flags %}
BUILD_APPS=ON
{{super()}}
{% endblock %}
