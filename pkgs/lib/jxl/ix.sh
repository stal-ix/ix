{% extends '//lib/jxl/t/ix.sh' %}

{% block cmake_flags %}
JPEGXL_ENABLE_TOOLS=OFF
{{super()}}
{% endblock %}
