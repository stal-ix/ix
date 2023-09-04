{% extends '//lib/tiff/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
tiff-opengl=OFF
tiff-tools=OFF
{% endblock %}
