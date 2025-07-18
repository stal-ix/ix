{% extends '//lib/mbedtls/t/ix.sh' %}

{% block pkg_name %}
mbedtls
{% endblock %}

{% block version %}
2.28.10
{% endblock %}

{% block fetch %}
https://github.com/ARMmbed/mbedtls/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0f2e0525903a89ae1d39ce439d858be66933bda54c5b6102b72a29ed8fe7c088
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-mbedtls=${out} --with-crypto-library=mbedtls \${COFLAGS}"
{% endblock %}
