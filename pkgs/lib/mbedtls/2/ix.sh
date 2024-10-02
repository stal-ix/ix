{% extends '//lib/mbedtls/t/ix.sh' %}

{% block fetch %}
https://github.com/ARMmbed/mbedtls/archive/refs/tags/v2.28.9.tar.gz
sha:e4dbcf86a4fb31506482888560f02b161e0ecfb82fee0643abcfc86abee5817e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-mbedtls=${out} --with-crypto-library=mbedtls \${COFLAGS}"
{% endblock %}
