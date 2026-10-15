{% extends '//die/env.sh' %}

{% block env %}
export CFLAGS="-msimd128 ${CFLAGS}"
export CXXFLAGS="-msimd128 ${CXXFLAGS}"
{% endblock %}
