{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
UHDR_BUILD_EXAMPLES=OFF
BUILD_SHARED_LIBS=ON
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}
