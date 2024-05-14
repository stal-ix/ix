{% extends '//lib/mbedtls/3/t/ix.sh' %}

{% block env %}
{{super()}}
export COFLAGS="--with-mbedtls=${out} --with-crypto-library=mbedtls \${COFLAGS}"
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_PROGRAMS=OFF
ENABLE_TESTING=OFF
{% endblock %}
