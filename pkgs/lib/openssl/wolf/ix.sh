{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/c
lib/wolfssl
lib/openssl/fake
{% endblock %}

{% block install %}
cp -R ${lib_wolfssl}/include/wolfssl ${out}/include
{% endblock %}
