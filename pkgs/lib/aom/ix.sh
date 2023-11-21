{% extends 't/ix.sh' %}

{% block cmake_flags %}
ENABLE_TOOLS=OFF
ENABLE_EXAMPLES=OFF
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|//.*/|/|' -i ${out}/lib/pkgconfig/aom.pc
{% endblock %}
