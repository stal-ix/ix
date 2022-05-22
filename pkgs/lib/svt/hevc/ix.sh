{% extends '//lib/svt/hevc/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
BUILD_APP=OFF
{% endblock %}
