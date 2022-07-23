{% extends '//lib/avif/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
AVIF_BUILD_APPS=ON
{% endblock %}
