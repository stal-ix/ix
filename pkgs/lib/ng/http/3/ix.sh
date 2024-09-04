{% extends 't/ix.sh' %}

{% block cmake_flags %}
ENABLE_LIB_ONLY=ON
{{super()}}
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-nghttp3=${out} \${COFLAGS}"
{% endblock %}
