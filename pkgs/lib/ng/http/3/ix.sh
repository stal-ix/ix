{% extends 't/ix.sh' %}

{% block cmake_flags %}
ENABLE_LIB_ONLY=ON
{{super()}}
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-DNGHTTP3_STATICLIB=1 \${CPPFLAGS}"
export COFLAGS="--with-nghttp3=${out} \${COFLAGS}"
{% endblock %}
