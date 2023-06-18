{% extends '//lib/iwasm/ix.sh' %}

{% block unpack %}
{{super()}}
cd product-mini/platforms/linux
{% endblock %}

{% block cmake_flags %}
WAMR_BUILD_INTERP=ON
{% endblock %}
