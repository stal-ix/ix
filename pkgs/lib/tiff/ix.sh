{% extends '//lib/tiff/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
tiff-tools=OFF
{% endblock %}
