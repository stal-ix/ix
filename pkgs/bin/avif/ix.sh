{% extends '//lib/avif/t/ix.sh' %}

{% block bld_libs %}
lib/png
lib/jpeg
lib/xml/2
bin/avif/argparse
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
AVIF_BUILD_APPS=ON
{% endblock %}

{% block patch %}
{{super()}}
>cmake/Modules/LocalLibargparse.cmake
{% endblock %}
