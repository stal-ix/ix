{% extends '//lib/svt/hevc/t/mix.sh' %}

{% block cmake_flags %}
{{super()}}
BUILD_APP=OFF
{% endblock %}
