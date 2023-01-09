{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/c
lib/wolfssl
lib/openssl/fake
{% endblock %}

{% block install %}
cp -R ${WOLFSSL_HEADERS} ${out}/include
{% endblock %}
