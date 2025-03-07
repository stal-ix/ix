{% extends '//lib/avif/t/ix.sh' %}

{% block bld_libs %}
lib/png
lib/jpeg
lib/xml/2
lib/argp/standalone
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
AVIF_BUILD_APPS=ON
{% endblock %}
