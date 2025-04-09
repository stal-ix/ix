{% extends '//lib/mbedtls/t/ix.sh' %}

{% block fetch %}
https://github.com/ARMmbed/mbedtls/archive/refs/tags/v2.28.10.tar.gz
sha:0f2e0525903a89ae1d39ce439d858be66933bda54c5b6102b72a29ed8fe7c088
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-mbedtls=${out} --with-crypto-library=mbedtls \${COFLAGS}"
{% endblock %}
