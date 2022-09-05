{% extends '//lib/openssl/fake/ix.sh' %}

{% block lib_deps %}
lib/c
lib/wolfssl
{% endblock %}

{% block install %}
{{super()}}
cp -R ${lib_wolfssl}/include/wolfssl ${out}/include
{% endblock %}
