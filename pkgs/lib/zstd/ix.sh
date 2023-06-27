{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ZSTD_BUILD_PROGRAMS=OFF
{% endblock %}

{% block env %}
export COFLAGS="--with-zstd=${out} \${COFLAGS}"
{% endblock %}
