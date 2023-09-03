{% extends '//lib/tiff/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
jbig=OFF
jpeg12=OFF
lerc=OFF
libdeflate=OFF
tiff-opengl=OFF
tiff-tools=OFF
{% endblock %}
