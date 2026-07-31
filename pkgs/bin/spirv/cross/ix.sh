{% extends '//lib/spirv/cross/ix.sh' %}

{% block cmake_flags %}
{{super()}}
SPIRV_CROSS_CLI=ON
{% endblock %}
